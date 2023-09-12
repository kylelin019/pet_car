using System;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class register : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (!IsPostBack)
        {
            GendelDropDownList.Items.Clear();
            GendelDropDownList.Items.Add(new ListItem("男", "男"));
            GendelDropDownList.Items.Add(new ListItem("女", "女"));
        }
    }
    protected void logoutbutton_Click(object sender, EventArgs e)
    {
        Response.Redirect("logout.aspx");
    }

    private string GenerateVerificationCode()
    {
        Random random = new Random();
        int length = 6;
        string verificationCode = "";
        for (int i = 0; i < length; i++)         {
            int digit = random.Next(0, 10);
            verificationCode += digit.ToString();
        }
        return verificationCode;
    }

    private void SaveVerificationCodeToDatabase(string Email, string verificationCode)
    {
        // 创建数据库连接
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string query = "INSERT INTO EmailCheck (Code, Email) VALUES (@Code, @Email)";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Code", verificationCode);
            command.Parameters.AddWithValue("@Email", Email);
            command.ExecuteNonQuery();
        }

    }



    private void SendVerificationEmail(string Email, string verificationCode)
    {
        SmtpClient smtpClient = new SmtpClient("smtp.gmail.com");
        smtpClient.Port = 587;
        smtpClient.EnableSsl = true;
        smtpClient.Credentials = new NetworkCredential("s1b01.one@gmail.com", "ztjsvgqjnsziohcc");

        MailMessage message = new MailMessage();
        message.From = new MailAddress("s1b01.one@gmail.com");
        message.To.Add(new MailAddress(Email));
        message.Subject = "Email Verification";
        message.Body = "您的驗證碼為： " + verificationCode;

        smtpClient.Send(message);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(EmailTextBox.Text))
        {
            Response.Write("<script>alert('請輸入emails');</script>");
        }
        else
        {
            string Email = EmailTextBox.Text;
            string verificationCode = GenerateVerificationCode();
            SaveVerificationCodeToDatabase(Email, verificationCode);
            SendVerificationEmail(Email, verificationCode);
            Session["VerificationCode"] = verificationCode;
            Response.Write("<script>alert('已發送驗證碼至您的信箱');</script>");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        // 获取用户输入的信息
        string Name = NameTextBox.Text;
        string IdNumber = IdTextBox.Text;
        string Phone = PhoneNumberTextBox.Text;
        string Address = AddresTextBoxs.Text;
        string Gender = GendelDropDownList.Text;
        string Email = EmailTextBox.Text;
        string Password = PasswordTextBox.Text;
        string verificationCode = VerificationCodeTextBox.Text;

        if (!string.IsNullOrEmpty(verificationCode) && Session["VerificationCode"] != null && verificationCode.Equals(Session["VerificationCode"].ToString()))
        {
            // 检查是否已存在相同的身份证号码
            try
            {
                
                // 创建数据库连接
                string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string checkQuery = "SELECT COUNT(*) FROM Owner WHERE IdNumber = @IdNumber";
                    using (SqlCommand checkCommand = new SqlCommand(checkQuery, connection))
                    {
                        checkCommand.Parameters.AddWithValue("@IdNumber", IdNumber);
                        int count = (int)checkCommand.ExecuteScalar();
                        if (count > 0)
                        {
                            // 身份证号码已存在，执行相应的处理逻辑
                            Response.Write("<script>alert('已重複註冊');</script>");
                            return; // 停止执行插入逻辑
                        }
                    }

                    // 执行插入新记录的逻辑
                    string insertQuery = "INSERT INTO Owner (Name, IdNumber, Phone, Address, Gender, Email, Password) VALUES (@Name, @IdNumber, @Phone, @Address, @Gender, @Email, @Password)";
                    using (SqlCommand insertCommand = new SqlCommand(insertQuery, connection))
                    {
                        insertCommand.Parameters.AddWithValue("@Name", Name);
                        insertCommand.Parameters.AddWithValue("@IdNumber", IdNumber);
                        insertCommand.Parameters.AddWithValue("@Phone", Phone);
                        insertCommand.Parameters.AddWithValue("@Address", Address);
                        insertCommand.Parameters.AddWithValue("@Gender", Gender);
                        insertCommand.Parameters.AddWithValue("@Email", Email);
                        insertCommand.Parameters.AddWithValue("@Password", Password);
                        insertCommand.ExecuteNonQuery();
                    }
                }

                // 移除验证码会话并显示成功消息
                Session.Remove("VerificationCode");
                Response.Write("<script>alert('註冊成功!');location='login.aspx'</script>");
            }
            catch (Exception ex)
            {
                // 处理数据库操作异常并显示错误消息
                Response.Write($"<script>alert('錯誤，請洽客服{ex.Message}');</script>");
            }
        }
        else
        {
            // 显示验证码错误消息
            Response.Write("<script>alert('驗證法錯誤，請重新輸入');</script>");
        }
    }
    }
