using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class reset_password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string resetToken = Request.QueryString["token"]; // 從 URL 中取得重設密碼的驗證碼

            // 创建数据库连接
            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT Name FROM Owner WHERE ResetPasswordToken = @token AND ResetPasswordExpiry >= CONVERT(DATETIME, GETDATE())";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@token", resetToken);

                connection.Open();
                object result = command.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                {
                    // 驗證碼有效，顯示重設密碼的介面
                    ResetPasswordPanel.Visible = true;
                    ResetPasswordToken.Value = resetToken;
                }
                else
                {
                    // 驗證碼無效，顯示錯誤訊息
                    ErrorLabel.Text = "無效的重設密碼驗證碼。";
                    ErrorPanel.Visible = true;
                }
            }
        }
    }


    protected void ResetPasswordButton_Click(object sender, EventArgs e)
    {
        string resetToken = ResetPasswordToken.Value; // 從隱藏欄位取得重設密碼的驗證碼
        string newPassword = NewPasswordTextBox.Text; // 取得新密碼

        // 更新資料庫中的使用者密碼
        // 创建数据库连接
        // 创建数据库连接
        //Data Source=203.64.129.232;Initial Catalog=SQL_Server;User ID=server;Password=server;
        //Data Source=(LocalDB)\\MSSQLLocalDB;Initial Catalog=Server;
        string connectionString = "Data Source=203.64.129.232;Initial Catalog=SQL_Server;User ID=server;Password=server";
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "UPDATE Owner SET Password = @Password, ResetPasswordToken = NULL, ResetPasswordExpiry = NULL WHERE ResetPasswordToken = @token";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Password", newPassword);
            command.Parameters.AddWithValue("@token", resetToken);

            connection.Open();
            int rowsAffected = command.ExecuteNonQuery();

            if (rowsAffected > 0)
            {
                // 密碼重設成功，顯示成功訊息
                SuccessLabel.Text = "密碼已成功重設。";
                SuccessPanel.Visible = true;
                ResetPasswordPanel.Visible = false;
            }
            else
            {
                // 密碼重設失敗，顯示錯誤訊息
                ErrorLabel.Text = "密碼重設失敗。請確認驗證碼的有效性。";
                ErrorPanel.Visible = true;
            }
        }
    }

}