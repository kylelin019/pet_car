using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;


public partial class pet : System.Web.UI.Page
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

        if (!IsPostBack)
        {
            if (User.Identity.IsAuthenticated)
            {
                string idNumber = Session["IDNumber"]?.ToString() ?? "none";
                int ownerID = GetOwnerIDFromTableOwner(idNumber);
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("OwnerID", ownerID.ToString());
                SqlDataSource1.DataBind(); // 将数据绑定放在这里
                GridView1.DataSourceID = "SqlDataSource1";
            }
            else
            {
                Response.Write("<script>alert('请先登入');</script>");
                Server.Transfer("~/login.aspx");
            }
        }
    }

    private int GetOwnerIDFromTableOwner(string idNumber)
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
                object result = command.ExecuteScalar();

                ownerID = Convert.ToInt32(result);
            }
        }

        return ownerID;
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int petID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex]["PetID"]);
        DeletePetRecord(petID);
    }

    private void DeletePetRecord(int petID)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "DELETE FROM [Pet] WHERE [PetID] = @PetID";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@PetID", petID);

                connection.Open();
                int rowsAffected = command.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    Response.Write("<script>alert('刪除成功!');location='pet.aspx'</script>");
                }
            }
        }
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1; // 取消编辑模式
        BindGridViewData(); // 重新绑定 GridView 数据
    }

    protected void add_pet_Click(object sender, EventArgs e)
    {
        Response.Redirect("add_pet.aspx");
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        int petID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["PetID"]);

        // 获取每个 RadioButton 的值
        RadioButton teethCleaningRadioButton = (RadioButton)row.FindControl("teethCleaningRadioButton");
        bool teethCleaningValue = teethCleaningRadioButton.Checked;

        RadioButton dewormingRadioButton = (RadioButton)row.FindControl("dewormingRadioButton");
        bool dewormingValue = dewormingRadioButton.Checked;

        RadioButton vaccinationRadioButton = (RadioButton)row.FindControl("vaccinationRadioButton");
        bool vaccinationValue = vaccinationRadioButton.Checked;

        RadioButton neuteredRadioButton = (RadioButton)row.FindControl("neuteredRadioButton");
        bool neuteredValue = neuteredRadioButton.Checked;

        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        try
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string updateQuery = "UPDATE [Pet] SET [TeethCleaning] = @TeethCleaningValue, [Deworming] = @DewormingValue, [Vaccination] = @VaccinationValue, [Neutered] = @NeuteredValue WHERE [PetID] = @PetID";

                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                    // 设置参数值
                    command.Parameters.AddWithValue("@TeethCleaningValue", teethCleaningValue);
                    command.Parameters.AddWithValue("@DewormingValue", dewormingValue);
                    command.Parameters.AddWithValue("@VaccinationValue", vaccinationValue);
                    command.Parameters.AddWithValue("@NeuteredValue", neuteredValue);

                    command.Parameters.AddWithValue("@PetID", petID);

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('更新成功!');location='pet.aspx'</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('更新失败!');location='pet.aspx'</script>");
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('更新失败: " + ex.Message + "');location='pet.aspx'</script>");
        }

        GridView1.EditIndex = -1;
        BindGridViewData();
    }





    private void BindGridViewData()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT * FROM Pet WHERE OwnerID = @OwnerID";
            int ownerID = 0;

            if (Session["OwnerID"] != null && int.TryParse(Session["OwnerID"].ToString(), out ownerID))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@OwnerID", ownerID);
                    connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        GridView1.DataSource = reader;
                        GridView1.DataBind();
                    }
                }
            }
        }
    }

    protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindGridViewData();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
