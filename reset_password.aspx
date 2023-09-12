<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reset_password.aspx.cs" Inherits="reset_password" %>

<!DOCTYPE html>
<html>
<head>
    <title>重設密碼</title>

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
    <style>    
        table {
            margin-left: auto;
            margin-right: auto;
        }

        .auto-style8 {
            background-color: rgba(255,255,255,0.3);
            width: 400px;
            margin: auto;
            box-shadow: 0 0 5px #333;
            margin-top: 5%;
            border-radius: 10px;
            border: 2px solid white;
        }

        .auto-style7 {
            width: 35%;
            height: 60px;
        }

        .new-h1 {
            text-align: center;
            margin-top: 50px;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
              margin-bottom: 40px;
        }

        .newpasswordbox {
            width: 150px;
            height: 35px;
            border-radius: 10px;
            border: 2px solid grey; /* Change border color to white */
            background-color: transparent;
        }

        .new-span {
            font-size: 18px;
            font-weight: bold;
            font-family: Arial, Helvetica, sans-serif;
            margin-bottom: 20px;
        }

        .input-with-icon {
            position: relative;
        }

            .input-with-icon i {
                position: absolute;
                top: 50%;
                left: 95px;
                transform: translateY(-50%);
            }

            .input-with-icon input {
                padding-left: 30px;
            }

        /* 原始按鈕樣式 */
        .loginbtn {
            display: inline-block;
            padding: .3rem 5rem;
            font-size: .9rem;
            border: 2px solid #fff;
            border-radius: 2rem;
            line-height: 1.5;
            margin: 3rem;
            transition: .3s;
            text-transform: uppercase;
            letter-spacing: 0.2em;
            font-weight: bold;
        }

            /* 在按鈕上懸停時的樣式 */
            .loginbtn:hover {
                background-color: #7FD3D1; /* 替換為您想要的背景顏色 */
                color: #fff; /* 替換為您想要的文本顏色 */
            }

            /* 當按鈕有特定類名'solid'時的樣式 */
            .loginbtn.solid, .loginbtn.transparent:hover {
                background-color: #fff;
                color: #69bde7;
            }

                /* 當按鈕有特定類名'transparent'時的樣式 */
                .loginbtn.transparent, .loginbtn.solid:hover {
                    background-color: transparent;
                    color: #fff;
                }

        .error {
            padding: 10px;
            margin-bottom: 40px;
            border: 2px solid #ff0000;
            color: #ff0000;
        }

        .success {
            padding: 10px;
            margin-left: 160px;
            margin-bottom: 40px;
            color: #7FD3D1;
            width: 50px;
            justify-content: center;
            align-items: center;
            border: 2px solid #7FD3D1;
        }
    </style>
</head>
<body>
     <header>
        <div class="container">
            <input type="checkbox" name="" id="check" />
            <div class="logo-container">
                
                    <a href="index.aspx"><img src="./image/pet-logo.png" alt="logo" width='100' ; /></a>
                
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
         <div class="auto-style8">

            <h1 class="new-h1">重設密碼</h1>
            <table>
                <tr>
                    <td>

                        <asp:Panel ID="ErrorPanel" runat="server" Class="error">
                            <asp:Label ID="ErrorLabel" runat="server"></asp:Label>
                        </asp:Panel>

                    </td>

                    <td>
                        <asp:Panel ID="ResetPasswordPanel" runat="server">
                            <input type="hidden" id="ResetPasswordToken" runat="server" />

                            <div class="input-with-icon">
                                <i class="fa fa-user"></i>
                                <label for="NewPasswordTextBox" class="new-span">新密碼：</label>&nbsp;&nbsp;
                                <asp:TextBox ID="NewPasswordTextBox" runat="server" TextMode="Password" CssClass="newpasswordbox" placeholder="身分證字號"></asp:TextBox>
                            </div>

                            <div>
                                <asp:Button ID="ResetPasswordButton" runat="server" Text="重設密碼" class="loginbtn" />
                            </div>

                        </asp:Panel>

                    </td>
                </tr>

            </table>

            <asp:Panel ID="SuccessPanel" runat="server" CssClass="success">
                <asp:Label ID="SuccessLabel" runat="server"></asp:Label>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
