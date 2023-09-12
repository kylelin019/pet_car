using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class forget_the_password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {

            string username = User.Identity.Name;
            UsernameLabel.Text = username;
            registerlabel.Visible = false;
            loginlabel.Visible = false;
            UsernameLabel.Visible = true;
            logoutbutton.Visible = true;
        }
        else
        {
            UsernameLabel.Visible = false;
            logoutbutton.Visible = false;
        }
    }
    protected void logoutbutton_Click(object sender, EventArgs e)
    {
        Response.Redirect("logout.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        // 创建数据库连接
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;


        string IdNumber = IdTextBox.Text; // 使用者名稱
        string Email = EmailTextBox.Text; // 使用者手機
        string ResetToken = Guid.NewGuid().ToString(); // 生成唯一的驗證碼或令牌

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string updateQuery = "UPDATE Owner SET ResetPasswordToken = @resetToken, ResetPasswordExpiry = DATEADD(MINUTE, 30, GETDATE()) WHERE IdNumber = @IdNumber AND Email = @Email";
            SqlCommand updateCommand = new SqlCommand(updateQuery, connection);
            updateCommand.Parameters.AddWithValue("@ResetToken", ResetToken);
            updateCommand.Parameters.AddWithValue("@IdNumber", IdNumber);
            updateCommand.Parameters.AddWithValue("@Email", Email);
            int rowsUpdated = updateCommand.ExecuteNonQuery();

            // 其他代码...
       

            string query = "SELECT Password, Email FROM Owner WHERE IdNumber = @IdNumber AND Email = @Email AND ResetPasswordToken = @ResetToken";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@IdNumber", IdNumber);
            command.Parameters.AddWithValue("@Email", Email);
            command.Parameters.AddWithValue("@ResetToken", ResetToken);

            SqlDataReader reader = command.ExecuteReader();

            // 其他代码...
        


            if (reader.Read())
                {
                    string password = reader["Password"].ToString(); // 使用者的密碼
                    string userEmail = reader["Email"].ToString(); // 使用者的信箱

                    // 設定寄件者的郵件資訊
                    string senderEmail = "s1b01.one@gmail.com"; // 寄件者的信箱
                    string senderPassword = "ztjsvgqjnsziohcc"; // 寄件者的密碼

                    // 建立郵件訊息
                    MailMessage message = new MailMessage();
                    message.From = new MailAddress(senderEmail);
                    message.To.Add(new MailAddress(userEmail));
                    message.Subject = "重設密碼";
                    message.Body = $"請點擊以下連結重設密碼：\n\nhttp://localhost:52156/reset_password.aspx?token={ResetToken}";

                    // 設定 SMTP 伺服器資訊
                    SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587); // 或者使用 465 連接埠
                    smtpClient.Credentials = new NetworkCredential(senderEmail, senderPassword);
                    smtpClient.EnableSsl = true;

                    // 發送郵件
                    try
                    {
                        smtpClient.Send(message);
                        Response.Write("<script>alert('重設連結已成功發送至您註冊時的電子郵件信箱');location='login.aspx'</script>");
                    }
                    catch (Exception)
                    {
                        Response.Write("<script>alert('發生錯誤');location='login.aspx'</script>");
                    }
                }
                else
                {
                    // 驗證失敗的處理邏輯
                    Response.Write("<script>alert('姓名或電子郵件錯誤');</script>");
                }
            }
    }
}
