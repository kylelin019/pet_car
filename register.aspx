<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>註冊</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="./css/Register.css" />
  
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
    <!-- ------------x---------------  Navigation --------------------------x------------------- -->
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
    <div class="center-container">
        <div class="container2">
            <div class="form-image">
                <img src="image/undraw_medicine_b-1-ol.svg" alt="" />
            </div>

            <div class="form">
                <form class="register" id="form1" runat="server">
                    <div class="form-header">
                        <div class="title">
                            <h1>帳號註冊</h1>
                        </div>
                        <div class="log-sign">
                            <asp:Label ID="loginlabel" runat="server"><a href="login.aspx" class="btn log">登入</a></asp:Label>
                        </div>
                    </div>
                    
                    <div class="input-group">
                        <div class="input-box">
                            <label for="firstname">飼主姓名:</label>
                            <asp:TextBox ID="NameTextBox" runat="server" placeholder="飼主姓名"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="請輸入姓名" ControlToValidate="NameTextBox" Display="None"></asp:RequiredFieldValidator>
                            <br />
                        </div>

                        <div class="input-box">
                            <label for="lastname">身分證字號:</label>
                            <asp:TextBox ID="IdTextBox" runat="server" placeholder="身分證字號"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="IdTextBox" ErrorMessage="*身分證字號格式錯誤" ValidationExpression="^[A-Z][0-9]{9}$" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="請輸入身分證字號" ControlToValidate="IdTextBox" Display="None"></asp:RequiredFieldValidator>
                        </div>

                        <div class="input-box">
                            <label for="number">聯絡電話:</label>
                            <asp:TextBox ID="PhoneNumberTextBox" runat="server" placeholder="(xx) xxxx-xxxx"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="PhoneNumberTextBox" ErrorMessage="*電話格式錯誤" ValidationExpression="^09\d{8}$" Display="Dynamic" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="請輸入聯絡電話" ControlToValidate="PhoneNumberTextBox" Display="None"></asp:RequiredFieldValidator>
                        </div>

                        <div class="input-box">
                            <label for="addres">通訊地址:</label>
                            <asp:TextBox ID="AddresTextBoxs" runat="server" placeholder="通訊地址"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="請輸入通訊地址" ControlToValidate="AddresTextBoxs" Display="None"></asp:RequiredFieldValidator>
                            <br />
                        </div>                       

                        <div class="input-box">

                            <label for="email">e-mail:</label>

                            <asp:TextBox ID="EmailTextBox" runat="server" TextMode="email" placeholder="email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="請輸入E-mail" ControlToValidate="EmailTextBox" Display="None"></asp:RequiredFieldValidator>

                        </div>

                        <div class="input-box">
                            <label for="email">驗證碼:</label>
                            <asp:TextBox ID="VerificationCodeTextBox" runat="server" placeholder="驗證碼" Width="150px" Height="40px">
                            </asp:TextBox><asp:Label ID="Label1" runat="server" Text="傳送驗證碼至信箱"></asp:Label>
                            <asp:Button ID="Button1" runat="server" Text="傳送" OnClick="Button1_Click" CausesValidation="false" CssClass="emailbtn" />
                        </div>

                        <div class="input-box">
                            <label for="gender">性別:</label>
                            <asp:DropDownList ID="GendelDropDownList" runat="server" CssClass="gender-dropdown"></asp:DropDownList>
                        </div>
                        <div class="input-box">
                            <label for="password">設定密碼:</label>
                            <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" placeholder="密碼6位數" Width="235px"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="PasswordTextBox" ErrorMessage="*密碼必須介於 8 到 16 個字元之間" ValidationExpression="^.{8,16}$" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="請輸入密碼" ControlToValidate="PasswordTextBox" Display="None"></asp:RequiredFieldValidator>
                        </div>

                        <div class="input-box">
                            <label for="confirmPassword">確認密碼:</label>
                            <asp:TextBox ID="confirmPasswordTextBox" runat="server" TextMode="Password" placeholder="確認密碼"></asp:TextBox>
                            <asp:CompareValidator ID="passwordCompareValidator" runat="server" ControlToValidate="confirmPasswordTextBox" ControlToCompare="passwordTextBox" ErrorMessage="*密碼與確認密碼不符" Display="Dynamic" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="請再次輸入密碼" ControlToValidate="PasswordTextBox" Display="None"></asp:RequiredFieldValidator>
                        </div>
                        <br /> <br />
                        <asp:Button ID="Button2" runat="server" Text="註冊" OnClick="Button2_Click" class="loginbtn" />
                        <br />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" />
                        <br /><br />
                    </div>
                     
                </form>
            </div>
        </div>
    </div>
</body>
</html>
