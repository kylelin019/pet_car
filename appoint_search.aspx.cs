using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class appoint_search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            //DropdownList預設空白
            PetNameDropDownList.Items.Insert(0, new ListItem("", ""));
            FillPetNamesDropdownList();

            // 验证是否成功填充PetNameDropDownList
            if (PetNameDropDownList.Items.Count <= 1)
            {
                // 没有成功填充寵物名稱，显示错误消息并重定向到 pet.aspx
                ScriptManager.RegisterStartupScript(this, GetType(), "NoPetsError", "alert('您尚未有任何寵物，請先新增寵物。'); window.location = 'pet.aspx';", true);
            }
        }
        if (User.Identity.IsAuthenticated)
        {

            string username = User.Identity.Name;

            UsernameLabel.Text = username;
            welcomeLabel.Visible = true;
            registerlabel.Visible = false;
            loginlabel.Visible = false;
            UsernameLabel.Visible = true;
            logoutlabel.Visible = true;
        }
        else
        {
            Response.Write("<script>alert('請先登入');</script>");
            Server.Transfer("~/login.aspx");
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

                    reader.Close();
                }
            }
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

    private int GetOwnerIDFromDatabase(string idNumber)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        int ownerID = 0;

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

        return ownerID;
    }

    // ...其他代码...

    protected void PetNameDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedPetName = PetNameDropDownList.SelectedValue;

        if (!string.IsNullOrEmpty(selectedPetName))
        {
            int petID = GetPetIDFromDatabase(selectedPetName);

            // 查询 appointment 数据表，根据 PetID 获取相关预约数据
            List<AppointmentData> appointments = GetAppointmentsByPetID(petID);

            if (appointments.Count > 0)
            {
                // 在此处按照 AppointmentDate 进行排序，將今天的日期排在最前面
                DateTime today = DateTime.Today;
                appointments = appointments.OrderBy(a => a.AppointmentDate != today).ThenBy(a => a.AppointmentDate).ToList();

                NewGridView.DataSource = appointments;
                NewGridView.DataBind();
            }
            else
            {
                NewGridView.DataSource = null;
                NewGridView.DataBind();
                ScriptManager.RegisterStartupScript(this, GetType(), "NoPetsError", "alert('目前尚未幫該寵物進行預約，請先預約。'); window.location = 'appoint_num.aspx';", true);
            }
        }
    }





    private List<AppointmentData> GetAppointmentsByPetID(int petID)
    {

        List<AppointmentData> appointments = new List<AppointmentData>();

        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string query = "SELECT a.*, c.ClinicName " +
                           "FROM Appointment a " +
                           "INNER JOIN Clinic c ON a.ClinicID = c.ClinicID " +
                           "WHERE a.PetID = @PetID";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@PetID", petID);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    // 构建AppointmentData对象，包括ClinicName
                    AppointmentData appointment = new AppointmentData
                    {
                        AppointmentID = Convert.ToInt32(reader["AppointmentID"]),
                        PetID = Convert.ToInt32(reader["PetID"]),
                        AppointmentDate = Convert.ToDateTime(reader["AppointmentDate"]), // 正確轉換日期
                        ClinicID = Convert.ToInt32(reader["ClinicID"]),
                        ClinicName = reader["ClinicName"].ToString(),
                        AppointmentTime = reader["AppointmentTime"].ToString() // 添加 AppointmentTime 字段
                    };

                    appointments.Add(appointment);
                }


                reader.Close();
            }
        }

        return appointments;
    }

    // ...其他代码...


    protected string GetClinicName(int ClinicID)
    {
        string clinicName = "";

        // 根據 ClinicID 查詢 ClinicName
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string query = "SELECT ClinicName FROM Clinic WHERE ClinicID = @ClinicID";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@ClinicID", ClinicID);

                clinicName = command.ExecuteScalar()?.ToString() ?? "";
            }
        }

        return clinicName;
    }

    // 在 NewGridView_RowDataBound 方法中获取诊所名
    protected void NewGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label clinicNameLabel = e.Row.FindControl("ClinicNameLabel") as Label;

            if (clinicNameLabel != null)
            {
                string clinicName = DataBinder.Eval(e.Row.DataItem, "ClinicName").ToString();
                clinicNameLabel.Text = clinicName;
            }

            DateTime appointmentDate = Convert.ToDateTime(DataBinder.Eval(e.Row.DataItem, "AppointmentDate"));

            if (appointmentDate.Date == DateTime.Today) // 检查是否是今天的日期
            {
                e.Row.ForeColor = System.Drawing.Color.Red; // 设置整行字体颜色为红色
            }
        }
    }













    // 根据英文大写代号获取对应的时间范围



    protected void logoutbutton_Click(object sender, EventArgs e)
    {
        Response.Redirect("logout.aspx");
    }
}
public class AppointmentData
{
    public int AppointmentID { get; set; }
    public int PetID { get; set; }
    public DateTime AppointmentDate { get; set; }
    public int ClinicID { get; set; }
    public string ClinicName { get; set; } // 添加这一行
    public string AppointmentTime { get; set; } // 添加 AppointmentTime 属性
    // 其他属性...
}


// 在页面类中的代码文件中继续实现其他部分
public partial class appoint_search : System.Web.UI.Page
{

    // 获取宠物的PetID
    private int GetPetIDFromDatabase(string petName)
    {
        int petID = 0;

        // 查询数据库，根据宠物名称获取PetID
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string query = "SELECT PetID FROM Pet WHERE PetName = @PetName";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@PetName", petName);

                petID = Convert.ToInt32(command.ExecuteScalar());
            }
        }

        return petID;
    }
    protected string GetFormattedTime(object appointmentTime)
    {
        if (appointmentTime != null && !string.IsNullOrEmpty(appointmentTime.ToString()))
        {
            string code = appointmentTime.ToString();

            // 使用 ConvertCodeToTimeRange 方法來進行英文大寫代號到時間範圍的轉換
            string timeRange = ConvertCodeToTimeRange(code);

            return timeRange;
        }

        return string.Empty;
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


}






