using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class healthy : System.Web.UI.Page
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
}