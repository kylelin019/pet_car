<%@ Page Language="C#" AutoEventWireup="true" CodeFile="appoint_search.aspx.cs" Inherits="appoint_search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>查詢預約</title>

    <link rel="stylesheet" href="css/appoint_search.css" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@300&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@500&family=Noto+Serif+TC:wght@300&display=swap" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <style>
        @import url("https://fonts.googleapis.com/css?family=Noto+Sans+TC:100,300,400,500,700,900&display=swap");
        @import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css");
    </style>

</head>
<body>
      <!-- ---------------------------  Navigation ------------------------- -->
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
                            <a href="platfrom_intro.aspx"><i class="fa fa-paw fa-1x"></i>&nbsp;寵愛平台</a>                            
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

    <br /><br /><br />
    <form id="form1" runat="server">
      
        <div style="text-align:center" class="pet-search" >
    <br />
             <span class="search-text">請選擇您所要查詢的寵物</span>
            <asp:DropDownList ID="PetNameDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="PetNameDropDownList_SelectedIndexChanged" ></asp:DropDownList>
        </div>
        
        <br />
        <div >
            <br />
            <asp:GridView ID="NewGridView" runat="server" AutoGenerateColumns="False" OnRowDataBound="NewGridView_RowDataBound" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">               
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="預約診所名稱">
                        <ItemTemplate>
                            <asp:Label ID="ClinicNameLabel" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="AppointmentDate" HeaderText="預約日期" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:TemplateField HeaderText="預約時間">
                        <ItemTemplate>
                            <asp:Label ID="AppointmentTimeLabel" runat="server" Text='<%# GetFormattedTime(Eval("AppointmentTime")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>               
                </Columns>
                
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQL_ServerConnectionString %>" SelectCommand="SELECT [ClinicID], [AppointmentDate], [AppointmentTime], [MentalStatus], [Appetite], [Drinking], [Breathing], [Defecation], [Urination], [Skin], [Odor], [Advanced], [Quotation] FROM [Appointment] WHERE ([PetID] = @PetID)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="PetID" SessionField="SelectedPetID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <br />
        <section class="divContent_group">
        <div class="knowHow_group">
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p class="title">☆看診提醒</p>
        <div class="content_group">
            <p class="txt_title">◆ 已預約看診</p> 
            <p class="txt_content">若您已幫寵物完成預約掛號程序，請再次以查詢掛號功能確認掛號完成。</p> 
            <p class="txt_title">◆ 報到</p> 
            <p class="txt_content">當日就診前，請在您已預約的時段之前，前往您所預約的診所進行掛號櫃台報到。</p> 
             <p class="txt_title">◆ 當日請假</p> 
            <p class="txt_content">若無法於當日前來就診，請在前一天提前通知掛號櫃檯，否則將被列入診所的紀錄黑名單。</p> 
            <p class="txt_title">◆請攜帶項圈、牽引繩 </p> 
            <p class="txt_content">帶寵物就診時，請務必攜帶項圈和牽引繩，並確保在前往寵物診所的途中將繩子繫在寵物的項圈上。即使您打算將寵物放入航空箱中，也請確保為狗狗穿好項圈並繫好繩子。
                一旦到達診所並登上診察台，請不要誤以為您可以解開繩子，因為有些狗狗可能會試圖逃跑，而這樣的情況可能導致不必要的事故。</p> 
            <p class="txt_title">◆ 便於查看症狀的樣品</p>
             <p class="txt_content">如果您遇到大便異常和嘔吐情況，將樣本提供給醫生有助於確立診斷。
                為了方便檢查，您可以使用紙杯容器收集尿液樣本，而大便樣本可以用保鮮膜或衛生紙包好。</p> 
            <p class="txt_title">◆ 與狗狗保持儘量近的距離</p>
             <p class="txt_content">確保狗狗保持在主人的前面，使用短牽引繩，避免讓狗狗隨意轉動。</p> 
          <div class="txt_tip">
            <span>溫馨提醒</span>
           <p>所有的看診提醒都是為了確保狗狗可以獲得有效的治療。因此，當您帶寵物去醫院時，
               <br />請務必要仔細留意！</p>
      </div>
    </div>
            </div>
            </section>
        <br /><br /><br /><br />
    <!----------------------footer------------------->
    <footer>
        <div class="footer-container">
            <!--**comoany-box**-->
            <div class="footer-company-box">
                <!--details-->
                <p>
                    本體系客戶服務時段為週一至週五10:00~12:00、14:00~17:00，不含例假日及國定假日，<br />
                    如需客戶服務請撥 0800-999-111，非服務時段請至「<a href="mailto:s1b01.one@gmail.com" style="color: #66a9a7; font-weight: 600;">客服信箱</a>」頁面留言。
                </p>
                <!--social-box-->
                <div class="footer-social">
                    <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                </div>
            </div>
            <!--**link-box***-->
            <div class="footer-link-box">
                <strong>會員功能</strong>
                <ul>
                    <li><a href="pet.aspx" style="color: grey"><i class="fa-solid fa-paw"></i>&nbsp;我的寵物</a></li>
                    <li><a href="appoint_num.aspx" style="color: grey"><i class="fa-solid fa-calendar-check"></i>&nbsp;預約掛號</a></li>
                    <li><a href="appoint_search.aspx" style="color: grey"><i class="fa-solid fa-magnifying-glass"></i>&nbsp;查詢預約</a></li>
                </ul>
            </div>
            <!--**link-box***-->
            <div class="footer-link-box">
                <a href="connect.aspx"><strong>寵物連接</strong></a>
                <ul>
                    <li><a href="healthy.aspx" style="color: grey"><i class="fa fa-arrow-right"></i>&nbsp;健康</a></li>
                    <li><a href="lifestyle.aspx" style="color: grey"><i class="fa fa-arrow-right"></i>&nbsp;生活方式</a></li>
                    <li><a href="announce.aspx" style="color: grey"><i class="fa fa-arrow-right"></i>&nbsp;訊息公告</a></li>
                </ul>
            </div>
            <!--**link-box***-->
            <div class="footer-link-box">
                <strong>相關連結</strong>
                <ul>
                    <li><a href="platfrom_intro.aspx" style="color: grey"><i class="fa fa-gratipay"></i>&nbsp;寵愛平台</a></li>
                    <li><a href="medical_map.aspx" style="color: grey"><i class="fa fa-map-marker fa-1x"></i>&nbsp;醫療據點</a></li>
                    <li><a href="mailto:s1b01.one@gmail.com" style="color: grey"><i class="fa-solid fa-envelope"></i>&nbsp;客服信箱</a></li>
                </ul>
            </div>
        </div>
        <hr />
        <div class="copyright">
            <h4>Copyright © 2023 by the Project Team of National Pingtung University  </h4>
        </div>
        <div class="move-up">
            <span><i class="fas fa-arrow-circle-up fa-2x"></i></span>
        </div>
    </footer>

    <!---moveup------->
    <script src="./scripts/moveup.js"></script>
    <!----AOS------->
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
        AOS.init({
            offset: 200,
            delay: 100,
            duration: 1000,
        });
    </script>
    </form>
</body>
</html>
