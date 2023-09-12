using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class add : System.Web.UI.Page
{




    protected void Button1_Click(object sender, EventArgs e)
    {
        if (!RadioButton1.Checked && !RadioButton2.Checked)
        {
            // Show an error message for the "是否有氣味？" RadioButton group
            ScriptManager.RegisterStartupScript(this, GetType(), "RadioButtonError", "alert('請選擇是否定期洗牙?');", true);
            return;
        }
        if (!RadioButton3.Checked && !RadioButton4.Checked)
        {
            // Show an error message for the "是否同意接受進階的醫療？" RadioButton group
            ScriptManager.RegisterStartupScript(this, GetType(), "RadioButtonError", "alert('請選擇是否定期驅蟲?');", true);
            return;
        }

        if (!RadioButton5.Checked && !RadioButton6.Checked)
        {
            // Show an error message for the "是否同意接受進階的醫療？" RadioButton group
            ScriptManager.RegisterStartupScript(this, GetType(), "RadioButtonError", "alert('請選擇是否注射疫苗?');", true);
            return;
        }

        if (!RadioButton7.Checked && !RadioButton8.Checked)
        {
            // Show an error message for the "是否同意接受進階的醫療？" RadioButton group
            ScriptManager.RegisterStartupScript(this, GetType(), "RadioButtonError", "alert('請選擇是否有結紮?');", true);
            return;
        }

        // 获取用户输入的信息
        string PetName = PetNameTextBox.Text;
        string Gendel = GendelDropDownList.Text;
        string PetType = PetTypeDropDownList.Text;
        string PetBreed = PetBreedDropDownList.Text; // 暫存品種
        string Gender = GendelDropDownList.Text;
        string Color = ColorDropDownList.Text;
        string BirthYear = YearDropDownList.Text;
        string BloodType = BloodTypeDropDownList.Text;
        bool TeethCleaning = RadioButton1.Checked;
        bool Deworming = RadioButton3.Checked;
        bool Vaccination = RadioButton5.Checked;
        bool Neutered = RadioButton7.Checked;

        if (string.IsNullOrEmpty(PetName))
        {
            // 显示提示框
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('請填寫寵物名字');", true);
            return; // 停止执行插入逻辑
        }

        if (string.IsNullOrEmpty(PetBreed))
        {
            // 显示提示框
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('請填寫寵物品種');", true);
            return; // 停止执行插入逻辑
        }

        if (string.IsNullOrEmpty(Color))
        {
            // 显示提示框
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('請填寫寵物顏色');", true);
            return; // 停止执行插入逻辑
        }


        // 获取IDNumber会话变量
        string IDNumber = (string)Session["IDNumber"];

        // 创建数据库连接
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        // 查询Owner信息
        string ownerQuery = "SELECT Name, OwnerID FROM Owner WHERE IDNumber = @IDNumber";
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            using (SqlCommand ownerCommand = new SqlCommand(ownerQuery, connection))
            {
                ownerCommand.Parameters.AddWithValue("@IDNumber", IDNumber);
                SqlDataReader reader = ownerCommand.ExecuteReader();
                if (reader.Read())
                {
                    string Name = reader["Name"].ToString();
                    int OwnerID = Convert.ToInt32(reader["OwnerID"]);

                    // 关闭数据读取器
                    reader.Close();

                    // 执行插入新记录的逻辑
                    string insertQuery = "INSERT INTO Pet (OwnerID, Name, PetName, Gender, PetType, PetBreed, Color, BirthYear, BloodType, TeethCleaning, Deworming, Vaccination, Neutered) VALUES (@OwnerID, @Name, @PetName, @Gender, @PetType, @PetBreed, @Color, @BirthYear, @BloodType, @TeethCleaning, @Deworming, @Vaccination, @Neutered)";
                    using (SqlCommand insertCommand = new SqlCommand(insertQuery, connection))
                    {
                        insertCommand.Parameters.AddWithValue("@OwnerID", OwnerID);
                        insertCommand.Parameters.AddWithValue("@Name", Name);
                        insertCommand.Parameters.AddWithValue("@PetName", PetName);
                        insertCommand.Parameters.AddWithValue("@Gender", Gender);
                        insertCommand.Parameters.AddWithValue("@PetType", PetType);
                        insertCommand.Parameters.AddWithValue("@PetBreed", PetBreed);
                        insertCommand.Parameters.AddWithValue("@Color", Color);
                        insertCommand.Parameters.AddWithValue("@BirthYear", BirthYear);
                        insertCommand.Parameters.AddWithValue("@BloodType", BloodType);
                        insertCommand.Parameters.AddWithValue("@TeethCleaning", TeethCleaning);
                        insertCommand.Parameters.AddWithValue("@Deworming", Deworming);
                        insertCommand.Parameters.AddWithValue("@Vaccination", Vaccination);
                        insertCommand.Parameters.AddWithValue("@Neutered", Neutered);
                        insertCommand.ExecuteNonQuery();
                    }
                }
                else
                {
                    Response.Write("<script>alert('無法找到對應的Owner信息');</script>");
                    return; // 停止执行插入逻辑
                }
            }
        }

        // 移除验证码会话并显示成功消息
        Session.Remove("VerificationCode");
        Response.Write("<script>alert('新增成功!');location='pet.aspx'</script>");
    }

    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
        if (RadioButton2.Checked)
        {
            Label1.Text = "記得帶寵物定期洗牙喔!";
            Label1.Visible = true;

        }
        else
        {
            Label1.Text = "";
        }
    }
    protected void RadioButton4_CheckedChanged(object sender, EventArgs e)
    {
        if (RadioButton4.Checked)
        {
            Label2.Text = "記得帶寵物定期驅蟲喔!";
            Label2.Visible = true;

        }
        else
        {
            Label1.Text = "";
        }
    }

    protected void RadioButton6_CheckedChanged(object sender, EventArgs e)
    {
        if (RadioButton6.Checked)
        {
            Label3.Text = "記得帶寵物注射疫苗喔!";
            Label3.Visible = true;
        }
        else
        {
            Label1.Text = "";
        }
    }

   
}

