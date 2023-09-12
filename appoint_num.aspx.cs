using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class appoint_num : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (User.Identity.IsAuthenticated)
            {
                string username = User.Identity.Name;
                string idNumber = GetOwnerIDFromSession(); // 获取用户的 IDNumber
                bool isBlacklisted = IsUserBlacklisted(idNumber); // 检查用户是否在黑名单中

                if (isBlacklisted)
                {
                    // 用户在黑名单中，显示警告消息并重定向到客服页面
                    ClientScript.RegisterStartupScript(this.GetType(), "BlacklistWarning", "alert('您已被列入黑名单，客服。'); window.location.href = 'index.aspx';", true);
                    return;
                }

                // 其他用户已登录的逻辑...
            }
            else
            {
                // 用户未登录，显示登入警告并重定向到登录页
                ClientScript.RegisterStartupScript(this.GetType(), "LoginWarning", "alert('請先登入'); window.location.href = 'login.aspx';", true);
            }

            // 设置日期选择框的最小值
            AppointmentDateTextBox.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");

            // 填充哪隻寵物的下拉列表
            FillPetNamesDropdownList();
        }
    }


    private void FillPetNamesDropdownList()
    {
        string idNumber = GetOwnerIDFromSession(); // 获取用户的 IDNumber
        int ownerID = GetOwnerIDFromDatabase(idNumber); // 获取 OwnerID
        if (ownerID != 0) // 确保 OwnerID 有效
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT PetName FROM Pet WHERE OwnerID = @OwnerID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@OwnerID", SqlDbType.Int).Value = ownerID;
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.HasRows) // 检查是否有数据
                    {
                        while (reader.Read())
                        {
                            try
                            {
                                string petName = reader["PetName"].ToString();
                                PetNameDropDownList.Items.Add(new ListItem(petName, petName));
                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine("Error adding pet name: " + ex.Message);
                            }
                        }
                    }
                    else
                    {
                        // 没有成功导入寵物，显示错误消息并重定向到 pet.aspx
                        ScriptManager.RegisterStartupScript(this, GetType(), "NoPetsError", "alert('您尚未有任何寵物。請先新增寵物，然後再進行預約。'); window.location = 'pet.aspx';", true);
                    }
                    reader.Close();
                }
            }
        }
    }


    // 其他方法省略...

    private int GetOwnerIDFromDatabase(string idNumber)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        int ownerID = 0; // 在这里声明并初始化 ownerID 变量
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT OwnerID FROM Owner WHERE IDNumber = @IDNumber";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@IDNumber", idNumber);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    ownerID = Convert.ToInt32(reader["OwnerID"]);
                }
                reader.Close();
            }
        }
        return ownerID; // 返回从数据库中获取的 ownerID 值
    }

    protected void DistrictDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedDistrict = DistrictDropDownList.SelectedValue;

        if (!string.IsNullOrEmpty(selectedDistrict))
        {
            // 创建数据库连接
            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // 查询符合行政區的所有诊所地址
                string addressQuery = "SELECT ClinicAddress FROM Clinic WHERE ClinicAddress LIKE '%' + @District + '%'";
                using (SqlCommand addressCommand = new SqlCommand(addressQuery, connection))
                {
                    addressCommand.Parameters.AddWithValue("@District", selectedDistrict);

                    SqlDataReader addressReader = addressCommand.ExecuteReader();

                    // 创建列表来存储地址
                    List<string> clinicAddresses = new List<string>();

                    while (addressReader.Read())
                    {
                        string clinicAddress = addressReader["ClinicAddress"].ToString();
                        clinicAddresses.Add(clinicAddress);
                    }

                    addressReader.Close();

                    // 查询对应的诊所名称并添加到 ClinicNameDropDownList
                    ClinicNameDropDownList.Items.Clear();

                    foreach (string address in clinicAddresses)
                    {
                        string ClinicNameQuery = "SELECT ClinicName FROM Clinic WHERE ClinicAddress = @Address";
                        using (SqlCommand nameCommand = new SqlCommand(ClinicNameQuery, connection))
                        {
                            nameCommand.Parameters.AddWithValue("@Address", address);

                            object ClinicName = nameCommand.ExecuteScalar();

                            if (ClinicName != null)
                            {
                                ClinicNameDropDownList.Items.Add(new ListItem(ClinicName.ToString(), ClinicName.ToString()));
                            }
                        }
                    }
                }
            }
        }
    }

    protected void logoutbutton_Click(object sender, EventArgs e)
    {
        Response.Redirect("logout.aspx");
    }

    // 省略前面的代码...

    // 省略前面的代码...

    protected void Button1_Click(object sender, EventArgs e)
    {
        string username = User.Identity.Name;
        string idNumber = GetOwnerIDFromSession(); // 获取Session中的IDNumber
        int ownerID = GetOwnerIDFromDatabase(idNumber); // 调用方法并传递idNumber参数
        // 检查用户是否在黑名单中

        string selectedDate = AppointmentDateTextBox.Text;

        // 获取今天的日期
        DateTime today = DateTime.Now.Date;

        // 将选定的日期转换为 DateTime 对象
        if (!DateTime.TryParse(selectedDate, out DateTime appointmentDate))
        {
            // 日期格式无效，显示错误消息
            ScriptManager.RegisterStartupScript(this, GetType(), "InvalidDate", "alert('請選擇有效的日期。');", true);
            return;
        }

        // 检查选定的日期是否在当前日期之后
        if (appointmentDate < DateTime.Now.Date)
        {
            // 选定的日期在当前日期之前，显示错误消息
            ScriptManager.RegisterStartupScript(this, GetType(), "PastDate", "alert('請選擇今天或未來的日期。');", true);
            return;
        }

        if (!RadioButton1.Checked && !RadioButton2.Checked)
        {
            // Show an error message for the "是否有氣味？" RadioButton group
            ScriptManager.RegisterStartupScript(this, GetType(), "RadioButtonError", "alert('請選擇是否有氣味？');", true);
            return;
        }

        if (!RadioButton3.Checked && !RadioButton4.Checked)
        {
            // Show an error message for the "是否同意接受進階的醫療？" RadioButton group
            ScriptManager.RegisterStartupScript(this, GetType(), "RadioButtonError", "alert('請選擇是否同意接受進階的醫療？');", true);
            return;
        }

        if (!RadioButton5.Checked && !RadioButton6.Checked)
        {
            // Show an error message for the "是否需要提前報價，或是選擇最適當藥物後再進行報價？" RadioButton group
            ScriptManager.RegisterStartupScript(this, GetType(), "RadioButtonError", "alert('請選擇是否需要提前報價？');", true);
            return;
        }

        // 获取用户选择的其他字段的值...
        string selectedTime = AppointmentTimeTextBox.SelectedValue;
        string mentalStatus = MentalStatusDropDownList.SelectedValue;
        string appetite = AppetiteDropDownList.SelectedValue;
        string drinking = DrinkingDropDownList.SelectedValue;
        string breathing = BreathingDropDownList.SelectedValue;
        string defecation = DefecationDropDownList.SelectedValue;
        string urination = UrinationDropDownList.SelectedValue;
        string skin = SkinDropDownList.SelectedValue;
        bool agreedOdor = RadioButton1.Checked; // 返回 True 或 False
        bool agreedAdvanced = RadioButton3.Checked;
        bool agreedQuotation = RadioButton5.Checked;

        // 检查用户是否选择了必填字段
        if (string.IsNullOrEmpty(selectedDate) || string.IsNullOrEmpty(selectedTime) || string.IsNullOrEmpty(mentalStatus) || string.IsNullOrEmpty(appetite)
            || string.IsNullOrEmpty(drinking) || string.IsNullOrEmpty(breathing) || string.IsNullOrEmpty(defecation) || string.IsNullOrEmpty(urination) || string.IsNullOrEmpty(skin))
        {
            // 提示用户必填字段
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('請確實填寫。');", true);
            return; // 停止继续执行
        }

        // 获取用户选择的诊所名称...
        string selectedClinicName = ClinicNameDropDownList.SelectedValue;

        // 获取Session中的IDNumber
        idNumber = GetOwnerIDFromSession();

        // 获取PetID
        string selectedPetName = PetNameDropDownList.SelectedValue; // 获取选定的宠物名字
        int petID = GetPetIDFromDatabase(selectedPetName); // 获取选定宠物的 PetID

        // 获取ClinicNameID
        int selectedClinicNameID = GetClinicIDFromName(selectedClinicName); // 获取 ClinicNameID

        // 检查诊所是否开放预约
        if (!IsClinicOpenForAppointments(selectedClinicNameID))
        {
            // 诊所不开放预约，显示提醒消息
            ScriptManager.RegisterStartupScript(this, GetType(), "ClinicNotOpen", "alert('很抱歉，您所選擇的寵物診所目前未提供預約。');", true);
            return;
        }
        // 在这里执行插入操作到数据库...
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // 查询是否已存在相同日期的预约记录
            string query = "SELECT COUNT(*) FROM Appointment WHERE PetID = @PetID AND AppointmentDate = @SelectedDate";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@PetID", petID);
                command.Parameters.AddWithValue("@SelectedDate", selectedDate);

                int existingAppointments = (int)command.ExecuteScalar();

                if (existingAppointments > 0)
                {
                    // 显示重复预约消息
                    ScriptManager.RegisterStartupScript(this, GetType(), "DuplicateAppointment", "alert('您已於該日期預約了。');", true);
                    return;
                }
            }

            string insertQuery = "INSERT INTO Appointment (OwnerID, PetID, AppointmentDate, AppointmentTime, MentalStatus, Appetite, Drinking, Breathing, Defecation, Urination, Skin, Odor, Advanced, Quotation, ClinicID) VALUES (@OwnerID, @PetID, @AppointmentDate, @AppointmentTime, @MentalStatus, @Appetite, @Drinking, @Breathing, @Defecation, @Urination, @Skin, @Odor, @Advanced, @Quotation, @ClinicID)";

            using (SqlCommand command = new SqlCommand(insertQuery, connection))
            {
                command.Parameters.AddWithValue("@OwnerID", ownerID);
                command.Parameters.AddWithValue("@PetID", petID);
                command.Parameters.AddWithValue("@AppointmentDate", selectedDate);
                command.Parameters.AddWithValue("@AppointmentTime", selectedTime);
                command.Parameters.AddWithValue("@MentalStatus", mentalStatus);
                command.Parameters.AddWithValue("@Appetite", appetite);
                command.Parameters.AddWithValue("@Drinking", drinking);
                command.Parameters.AddWithValue("@Breathing", breathing);
                command.Parameters.AddWithValue("@Defecation", defecation);
                command.Parameters.AddWithValue("@Urination", urination);
                command.Parameters.AddWithValue("@Skin", skin);
                command.Parameters.AddWithValue("@Odor", agreedOdor);
                command.Parameters.AddWithValue("@Advanced", agreedAdvanced);
                command.Parameters.AddWithValue("@Quotation", agreedQuotation);
                command.Parameters.AddWithValue("@ClinicID", selectedClinicNameID);

                try
                {
                    command.ExecuteNonQuery();
                    // 成功插入时显示提示信息
                    // 插入失败时显示提示信息
                    string successMessage = $"預約成功！\\n您所預約的診所名稱為：{selectedClinicName}\\n預約時段為：{ConvertCodeToTimeRange(selectedTime)}\\n寵物名稱為：{selectedPetName}\\n您已完成預約掛號程序，請再次以查詢掛號功能確認掛號完成";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessAlert", $"alert('{successMessage}'); window.location.href='appoint_search.aspx';", true);
                }
                catch (Exception)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('預約失敗，請重新預約。');", true);
                }
            }
        }

        // 执行其他操作...
    }


    private bool IsClinicOpenForAppointments(int clinicID)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // 查询诊所的 Open 字段是否为 True
            string query = "SELECT [Open] FROM Clinic WHERE ClinicID = @ClinicID";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@ClinicID", clinicID);

                object result = command.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                {
                    // 检查 Open 是否为 True
                    return (bool)result;
                }
            }
        }

        return false; // 如果未找到记录，默认返回 false
    }


    private bool HasAppointmentForToday(DateTime today)
    {
        string idNumber = GetOwnerIDFromSession();
        int ownerID = GetOwnerIDFromDatabase(idNumber);

        // 获取 PetID
        string selectedPetName = PetNameDropDownList.SelectedValue;
        int petID = GetPetIDFromDatabase(selectedPetName);

        // 创建数据库连接
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // 查询是否已存在今天的预约记录
            string query = "SELECT COUNT(*) FROM Appointment WHERE OwnerID = @OwnerID AND PetID = @PetID AND AppointmentDate = @Today";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@OwnerID", ownerID);
                command.Parameters.AddWithValue("@PetID", petID);
                command.Parameters.AddWithValue("@Today", today);

                int existingAppointments = (int)command.ExecuteScalar();

                // 如果已存在今天的预约记录（existingAppointments 大于 0），则返回 true
                return existingAppointments > 0;
            }
        }
    }
    private static Dictionary<string, string> codeToTimeRangeMap = new Dictionary<string, string>
{
    {"A", "8:00~9:00"},
    {"B", "9:00~10:00"},
    {"C", "10:00~11:00"},
    {"D", "11:00~12:00"},
    {"E", "12:00~13:00"},
    {"F", "13:00~14:00"},
    {"G", "14:00~15:00"},
    {"H", "15:00~16:00"},
    {"I", "16:00~17:00"},
    {"J", "17:00~18:00"},
    {"K", "18:00~19:00"},
    {"L", "19:00~20:00"},
    {"M", "20:00~21:00"},
    {"N", "21:00~22:00"},
    {"O", "22:00~23:00"},
    // ... 其他代号和时间范围的映射关系
};

    private static string ConvertCodeToTimeRange(string code)
    {
        if (codeToTimeRangeMap.ContainsKey(code))
        {
            return codeToTimeRangeMap[code];
        }
        else
        {
            return "Unknown";
        }
    }

    private string GetOwnerIDFromSession()
    {
        if (Session["IDNumber"] != null)
        {
            return Session["IDNumber"].ToString();
        }
        return string.Empty;
    }

    private List<string> GetPetsForOwner(int ownerID)
    {
        List<string> petNames = new List<string>();

        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string query = "SELECT PetName FROM Pet WHERE OwnerID = @OwnerID";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@OwnerID", ownerID);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    string petName = reader["PetName"].ToString();
                    petNames.Add(petName);
                }

                reader.Close();
            }
        }

        return petNames;
    }


    // 其他方法...


    // 其他方法...

    private int GetPetIDFromDatabase(string petName)
    {
        int petID = 0; // 默认值

        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string query = "SELECT PetID FROM Pet WHERE PetName = @PetName";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@PetName", petName);

                // 执行查询并获取结果
                object result = command.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                {
                    // 不要尝试将结果转换为整数
                    // 直接使用结果即可
                    petID = (int)result; // 假设 PetID 是 int 类型
                }
            }
        }

        return petID;
    }


    private int GetClinicIDFromName(string ClinicName)
    {
        int clinicID = 0; // 默认值

        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string query = "SELECT ClinicID FROM Clinic WHERE ClinicName = @ClinicName";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@ClinicName", ClinicName);

                // 执行查询并获取结果
                object result = command.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                {
                    // 不要尝试将结果转换为整数
                    // 直接使用结果即可
                    clinicID = (int)result; // 假设 ClinicID 是 int 类型
                }
            }
        }

        return clinicID;
    }
    private bool IsUserBlacklisted(string idNumber)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string query = "SELECT Blacklist FROM Owner WHERE IDNumber = @IDNumber";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@IDNumber", idNumber);

                object result = command.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                {
                    return (bool)result; // 如果 Blacklist 为 true，则用户在黑名单中
                }
            }
        }

        return false; // 如果未找到记录，默认返回 false
    }



}
