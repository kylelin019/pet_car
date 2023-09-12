<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pet.aspx.cs" Inherits="pet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>我的寵物</title>

    <link rel="stylesheet" href="css/pet.css" />
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
    <script type="text/javascript">
        function confirmDelete() {
            return confirm('您確定要刪除這隻寵物嗎？');
        }
    </script>

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

   
<!-- ----- my-----page------------------------- -->
    <div id="page-container">
        <form runat="server">
            <section class="addpet">
                 <div class="addpet-btn-container">
                    <asp:Button ID="add_pet" runat="server" Text="新增寵物" OnClick="add_pet_Click" class="addpet-btn" />
                </div>               
            </section>
            
<!-- ----- GridView my pet-------------------- -->
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="PetID" BackColor="White" BorderColor="#DEDFDE" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="319px" Width="1285px" BorderStyle="None" OnRowEditing="GridView1_RowEditing1" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="寵物名稱">
                        <ItemTemplate>
                            <span class="fa-icon">
                            <%# Eval("PetName") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="寵物種類">
                        <ItemTemplate>
                            <span class="fa-icon">
                            <%# Eval("PetType") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="性別">
                        <ItemTemplate>
                             <span class="fa-icon">
                            <%# Eval("Gender") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="顏色">
                        <ItemTemplate>
                             <span class="fa-icon">
                            <%# Eval("Color") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="出生年份">
                        <ItemTemplate>
                             <span class="fa-icon">
                            <%# Eval("BirthYear") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="血型">
                        <ItemTemplate>
                             <span class="fa-icon">
                            <%# Eval("BloodType") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="洗牙">
                        <ItemTemplate>
                              <span class="fa-icon">
                            <%# (Eval("TeethCleaning") != DBNull.Value && Convert.ToBoolean(Eval("TeethCleaning"))) ? "O" : "X" %></span>
                        </ItemTemplate>

                        <EditItemTemplate>
                              <span class="fa-icon">
                            <asp:RadioButton ID="teethCleaningRadioButton" runat="server" GroupName="TeethCleaningGroup" Text="是" Checked='<%# Bind("TeethCleaning") %>' />&nbsp;&nbsp;
                            <asp:RadioButton ID="teethCleaningRadioButtonNo" GroupName="TeethCleaningGroup" Text="否" runat="server" /></span>
                        </EditItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="驅蟲">
                        <ItemTemplate>
                              <span class="fa-icon">
                            <%# (Eval("Deworming") != DBNull.Value && Convert.ToBoolean(Eval("Deworming"))) ? "O" : "X" %></span>
                        </ItemTemplate>
                        <EditItemTemplate>
                              <span class="fa-icon">
                            <asp:RadioButton ID="dewormingRadioButton" runat="server" GroupName="DewormingGroup" Text="是" Checked='<%# Bind("Deworming") %>' />&nbsp;&nbsp;
                            <asp:RadioButton ID="dewormingRadioButtonNo" GroupName="DewormingGroup" Text="否" runat="server" /></span>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="疫苗">
                        <ItemTemplate>
                              <span class="fa-icon">
                            <%# (Eval("Vaccination") != DBNull.Value && Convert.ToBoolean(Eval("Vaccination"))) ? "O" : "X" %></span>
                        </ItemTemplate>
                        <EditItemTemplate>
                              <span class="fa-icon">
                            <asp:RadioButton ID="vaccinationRadioButton" runat="server" GroupName="VaccinationGroup" Text="是" Checked='<%# Bind("Vaccination") %>' />&nbsp;&nbsp;
                            <asp:RadioButton ID="vaccinationRadioButtonNo" GroupName="VaccinationGroup" Text="否" runat="server" /></span>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="结紮">
                        <ItemTemplate>
                              <span class="fa-icon">
                            <%# (Eval("Neutered") != DBNull.Value && Convert.ToBoolean(Eval("Neutered"))) ? "O" : "X" %></span>
                        </ItemTemplate>
                        <EditItemTemplate>
                              <span class="fa-icon">
                            <asp:RadioButton ID="neuteredRadioButton" runat="server" GroupName="NeuteredGroup" Text="是" Checked='<%# Bind("Neutered") %>' />&nbsp;&nbsp;
                            <asp:RadioButton ID="neuteredRadioButtonNo" GroupName="NeuteredGroup" Text="否" runat="server" /></span>
                        </EditItemTemplate>
                    </asp:TemplateField>
                
                    <asp:TemplateField HeaderText="編輯">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" Text="">
                                <span class="fa-icon">
                            <i class="fa-solid fa-pen-to-square"></i></span>
                                </asp:LinkButton>
                        </ItemTemplate>
                    
                        <EditItemTemplate>
                                 <span class="fa-icon">
                            <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update" Text="更新">                             
                                <i class="fa-solid fa-check"></i>&nbsp;&nbsp;
                            </asp:LinkButton>
                            <asp:LinkButton ID="lnkCancel" runat="server" CommandName="Cancel" Text="取消">                               
                                <i class="fa-solid fa-xmark"></i></asp:LinkButton>
                                      </span>
                        </EditItemTemplate>
                    </asp:TemplateField>
                   
                       <asp:TemplateField HeaderText="刪除">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" OnClientClick="return confirmDelete();">
                                <span class="fa-icon">
                            <i class="fa-solid fa-trash"></i></span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>

          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQL_ServerConnectionString %>"
                SelectCommand="SELECT DISTINCT * FROM [Pet] WHERE ([OwnerID] = @OwnerID)"
                DeleteCommand="DELETE FROM [Pet] WHERE [PetID] = @PetID"
                UpdateCommand="UPDATE [Pet] SET [TeethCleaning] = @TeethCleaning, [Deworming] = @Deworming, [Vaccination] = @Vaccination, [Neutered] = @Neutered WHERE [PetID] = @PetID">
                <SelectParameters>
                    <asp:Parameter DefaultValue="data" Name="OwnerID" Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="PetID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TeethCleaning" Type="Boolean" ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="Deworming" Type="Boolean" ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="Vaccination" Type="Boolean" ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="Neutered" Type="Boolean" ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="PetID" Type="Int32" />
                </UpdateParameters>

            </asp:SqlDataSource>
 


        </form>

    </div>
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

</body>
</html>
