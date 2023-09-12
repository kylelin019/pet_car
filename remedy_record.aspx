<%@ Page Language="C#" AutoEventWireup="true" CodeFile="remedy_record.aspx.cs" Inherits="inquire_appoint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>病例資料</title>

    <link rel="stylesheet" href="css/clinic_map.css" />

      <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@300&display=swap" rel="stylesheet" />
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
                        <li class="log-sign" style="--i: 1.8s">
                            <asp:Label ID="UsernameLabel" runat="server" Text=""></asp:Label>
                            <asp:Label ID="welcomeLabel" runat="server" Text="，您好"></asp:Label>&nbsp;&nbsp;
                            <asp:Label ID="logoutlabel" runat="server"><a href="logout.aspx" class="btn log">登出</a></asp:Label>
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
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
