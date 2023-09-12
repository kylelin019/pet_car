using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class clinic_map : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
            UsernameLabel.Visible = false;
            welcomeLabel.Visible = false;
            logoutlabel.Visible = false;
        }
    }
    protected void logoutbutton_Click(object sender, EventArgs e)
    {
        Response.Redirect("logout.aspx");
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

                    // 添加空白项
                    ClinicNameDropDownList.Items.Clear();
                    ClinicNameDropDownList.Items.Add(new ListItem("", "")); // 空白项

                    while (addressReader.Read())
                    {
                        string clinicAddress = addressReader["ClinicAddress"].ToString();
                        clinicAddresses.Add(clinicAddress);
                    }

                    addressReader.Close();

                    // 查询对应的诊所名称并添加到 ClinicNameDropDownList
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









    protected void ClinicNameDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        // 获取所选项的值
        string selectedClinicName = ClinicNameDropDownList.SelectedValue;

        // 这里假设您的数据库连接字符串存储在 web.config 文件中，可以通过 ConfigurationManager 获取它
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // 使用参数化查询以防止 SQL 注入
            string query = "SELECT ClinicID FROM Clinic WHERE ClinicName = @ClinicName";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@ClinicName", selectedClinicName);

            // 执行查询并获取 ClinicID
            int clinicID = 0; // 默认值，如果没有找到匹配的诊所名
            object result = command.ExecuteScalar();
            if (result != null)
            {
                clinicID = Convert.ToInt32(result);
            }

            // 关闭数据库连接
            connection.Close();

            // 构建目标页面 URL，并进行重定向
            string targetPage = "clinic" + clinicID + ".aspx";
            Response.Redirect(targetPage);
        }
    }

}
