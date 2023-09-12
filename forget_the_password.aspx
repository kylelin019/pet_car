<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forget_the_password.aspx.cs" Inherits="forget_the_password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>forget_the_password</title>

    <link rel="stylesheet" href="css/Login.css" />
    <link rel="stylesheet" href="css/Forget_the_password.css" />
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        @import url("https://fonts.googleapis.com/css?family=Noto+Sans+TC:100,300,400,500,700,900&display=swap");
        @import url("https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css");
        @import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css");

        body {
            background: linear-gradient(to bottom right, #7fd3d1, #8cd7d6, #99dcda, #ffd3c1,#ffceba,#FFFFC8B2);
        }


        .auto-style9 {
            background-color: transparent;
            border-radius: 10px;
            height: 500px;
        }
    </style>

</head>
<body style="height: 717px">
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
                            <a href="#"><i class="fa fa-paw fa-1x"></i>&nbsp;認識平台<i class="fas fa-caret-down"></i></a>
                            <div class="dropdown">
                                <ul>
                                    <li class="dropdown-link">
                                        <a href="#page1">平台簡介</a>
                                    </li>
                                    <li class="dropdown-link">
                                        <a href="#page2">特色服務</a>
                                    </li>

                                </ul>

                            </div>
                        </li>
                        <li class="nav-link" style="--i: .85s">
                            <a href="medical_map.aspx"><i class="fa fa-map-marker fa-1x"></i>&nbsp;醫療服務</a>
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
                                </ul>
                            </div>
                        </li>
                        <li class="nav-link" style="--i: 1.35s">
                            <a href="announc.aspx"><i class="fa fa-bullhorn fa-1x"></i>&nbsp;訊息公告</a>
                        </li>
                        <li class="nav-link" style="--i: 1.5s">
                            <a href="#"><i class="fa fa-paw fa-1x"></i>&nbsp;其他<i class="fas fa-caret-down"></i></a>
                            <div class="dropdown">
                                <ul>
                                    <li class="dropdown-link">
                                        <a href="#">其他 1</a>
                                    </li>
                                    <li class="dropdown-link">
                                        <a href="#">其他 2</a>
                                    </li>
                                    <li class="dropdown-link">
                                        <a href="#">其他 3</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="log-sign" style="--i: 1.8s">
                            <asp:Label ID="UsernameLabel" runat="server" Text=""></asp:Label>
                            <asp:Button ID="logoutbutton" runat="server" Text="登出" OnClick="logoutbutton_Click" />
                            <asp:Label ID="loginlabel" runat="server"><a href="login.aspx" class="btn log">登入</a></asp:Label>
                            <asp:Label ID="registerlabel" runat="server"><a href="register.aspx" class="btn sign">註冊</a></asp:Label>

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

  <section class="forget-password-section">
        <form class="forget_the_password" id="form1" runat="server">         
            <div class="auto-style9">
                <h1><i class="fa fa-key">&nbsp;</i>忘記密碼</h1>
                <br />
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

                                <asp:TextBox ID="IdTextBox" runat="server" Width="150px" placeholder="身分證字號" CssClass="auto-style2"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*請輸入註冊時身分證字號" ControlToValidate="IdTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>

                    <tr>
                        <td style="text-align: right" class="auto-style1">G-mail：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                            <br />
                        </td>
                        <td class="auto-style7">
                            <div class="input-with-icon">
                                <i class="fa fa-envelope"></i>

                                <asp:TextBox ID="EmailTextBox" runat="server" Width="150px" placeholder="G-mail" CssClass="auto-style2"></asp:TextBox>

                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*請輸入註冊時G-mail" ControlToValidate="EmailTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" style="text-align: center">
                            <br />
                            <br />
                            <asp:Button ID="Button1" runat="server" Text="傳送密碼" OnClick="Button1_Click" class="loginbtn" />
                            <br />
                            <br />
                            <br />
                            <br />

                        </td>

                    </tr>

                </table>
            </div>                
        </form>
      </section>
  
</body>
</html>
