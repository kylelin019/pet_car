<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>

    <link rel="stylesheet" href="css/Login.css" />

     <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@500&family=Noto+Serif+TC:wght@300&display=swap" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <style>
        @import url("https://fonts.googleapis.com/css?family=Noto+Sans+TC:100,300,400,500,700,900&display=swap");
        @import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css");    
    </style>

</head>
<body>
    <div class="background-image">
       <header>
        <div class="container">
            <input type="checkbox" name="" id="check" />
            <div class="logo-container">
               <a href="index.aspx" >
                     <img src="./image/logo-b.png" alt="logo"  width='320'; />
                 </a>  
            </div>

            <div class="nav-btn">
                <div class="nav-links">
                    <ul>
                        <li class="nav-link" style="--i: .6s">
                            <a href="platfrom_intro.aspx"><i class="fa fa-gratipay"></i>&nbsp;寵愛平台</a>
                        </li>
                        <li class="nav-link" style="--i: .85s">
                            <a href="clinic_map.aspx"><i class="fa fa-map-marker fa-1x"></i>&nbsp;診所據點</a>
                        </li>
                        <li class="nav-link" style="--i: 1.1s">
                            <a href="#"><i class="fa fa-user fa-1x"></i>&nbsp;會員功能<i class="fas fa-caret-down"></i></a>
                            <div class="dropdown">
                                <ul>
                                    <li class="dropdown-link">
                                        <a href="pet.aspx">我的寵物</a>
                                    </li>
                                    <li class="dropdown-link">
                                        <a href="appoint_num.aspx">預約掛號</a>
                                    </li>
                                    <li class="dropdown-link">
                                        <a href="appoint_search.aspx">查詢預約</a>
                                    </li>
                                    <li class="dropdown-link">
                                        <a href="inquire_appoint.aspx">病歷資料</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-link" style="--i: 1.35s">
                            <a href="connect.aspx"><i class="fa fa-bullhorn fa-1x"></i>&nbsp;寵物連接</a>
                        </li>
                        
                        
                    </ul>
                </div>
            </div>
            <div class="menu-container">
                <div class="menu">
                    <div></div>
                </div>
            </div>
        </div>
    </header>

        <form class="login" id="form1" runat="server">

            <div class="auto-style8">

                <h1>帳號登入</h1>
                <br />
                <table>
                    <tr>
                        <td style="text-align: right" class="auto-style6">身分證字號：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <br />
                            <br />
                        </td>
                        <td class="auto-style7">
                            <div class="input-with-icon">
                                <i class="fa fa-user"></i>
                                <asp:TextBox ID="IDTextBox" runat="server" Width="150px" placeholder="身分證字號" CssClass="auto-style2"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*請輸入身分證字號" ControlToValidate="IdTextBox" Display="None"></asp:RequiredFieldValidator>
                            </div>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right" class="auto-style1">密碼：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <br />
                            <br />
                        </td>
                        <td class="auto-style7">
                            <div class="input-with-icon">
                                <i class="fa fa-lock"></i>
                                <asp:TextBox ID="PasswordTextBox" runat="server" Width="150px" placeholder="密碼" CssClass="auto-style2"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*請輸入密碼" ControlToValidate="PasswordTextBox" Display="None"></asp:RequiredFieldValidator>
                            </div>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right" class="auto-style5">
                            <br />
                            <asp:CheckBox ID="chkRememberMe" runat="server" class="auto-style1" Text="保持登入" />
                            <br />
                            <br />
                        </td>
                        <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="forget_the_password.aspx" CssClass="hy">忘記密碼?</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center">

                            <asp:Button ID="Button1" runat="server" Text="登入" OnClick="Button1_Click" class="loginbtn" />
                            <br />
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center" class="hy">
                            <br />
                            沒有帳戶?<a href="register.aspx">&nbsp;註冊</a>
                            <br />

                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
</body>
</html>
