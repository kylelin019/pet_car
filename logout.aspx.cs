using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 清除身分驗證票證
        FormsAuthentication.SignOut();

        // 清除任何與使用者相關的會話資料
        Session.Clear();
        Session.Abandon();

        // 將使用者重新導向到登出後的頁面
        Response.Redirect("index.aspx");
    }

}