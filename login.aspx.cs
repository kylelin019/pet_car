using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    // 從資料庫中獲取OwnerID
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

    // 從資料庫中獲取姓名
    private string GetNameFromDatabase(string idNumber)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        string name = string.Empty;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT Name FROM Owner WHERE IDNumber = @IDNumber";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@IDNumber", idNumber);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    name = reader["Name"].ToString();
                }

                reader.Close();
            }
        }

        return name;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string idNumber = IDTextBox.Text;
            string password = PasswordTextBox.Text;

            string checkExistenceQuery = "SELECT COUNT(*) FROM Owner WHERE IDNumber = @IDNumber";

            using (SqlCommand checkExistenceCommand = new SqlCommand(checkExistenceQuery, connection))
            {
                checkExistenceCommand.Parameters.AddWithValue("@IDNumber", idNumber);

                connection.Open();

                int existenceCount = (int)checkExistenceCommand.ExecuteScalar();

                if (existenceCount == 0)
                {
                    Response.Write("<script>alert('此帳號不存在，請先註冊');location='register.aspx'</script>");
                }
            }

            // 繼續進行密碼驗證
            string query = "SELECT COUNT(*) FROM Owner WHERE IDNumber = @IDNumber AND Password = @Password";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@IDNumber", idNumber);
                command.Parameters.AddWithValue("@Password", password);

                int count = (int)command.ExecuteScalar();
                if (count > 0)
                {
                    // 將 IDNumber 儲存到 Session
                    Session["IDNumber"] = idNumber;
                    int ownerID = GetOwnerIDFromDatabase(idNumber);
                    string name = GetNameFromDatabase(idNumber);

                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                        1,
                        name,
                        DateTime.Now,
                        DateTime.Now.AddMinutes(100),
                        true, // 始终保持登录状态
                        ownerID.ToString(),
                        FormsAuthentication.FormsCookiePath
                    );

                    string encryptedTicket = FormsAuthentication.Encrypt(ticket);

                    HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
                    authCookie.Expires = ticket.Expiration;

                    Response.Cookies.Add(authCookie);

                    connection.Close();
                    Response.Redirect("index.aspx");
                }
                else
                {
                    Response.Write("<script>alert('密碼錯誤');location='login.aspx'</script>");
                }

                connection.Close();
            }
        }
    }

}
