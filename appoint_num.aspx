<%@ Page Language="C#" AutoEventWireup="true" CodeFile="appoint_num.aspx.cs" Inherits="appoint_num" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>預約掛號</title>
    <link rel="stylesheet" href="css/Login.css" />
    <link rel="stylesheet" href="css/Appoint_num.css" />

    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

    <style>
        @import url("https://fonts.googleapis.com/css?family=Noto+Sans+TC:100,300,400,500,700,900&display=swap");
        @import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css");
    </style>
    <script runat="server">
        protected void CityDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedCity = CityDropDownList.SelectedValue;

            // 清空之前的選項
            DistrictDropDownList.Items.Clear();

            if (selectedCity == "屏東縣")
            {
                // 添加屏東縣的行政區選項
                DistrictDropDownList.Items.Insert(0, new ListItem("", ""));
                DistrictDropDownList.Items.Add(new ListItem("屏東市", "屏東市"));
                DistrictDropDownList.Items.Add(new ListItem("萬丹鄉", "萬丹鄉"));
                DistrictDropDownList.Items.Add(new ListItem("潮州鎮", "潮州鎮"));

                // 添加其他屏東縣行政區選項
            }
            if (selectedCity == "高雄市")
            {
                // 添加屏東縣的行政區選項
                DistrictDropDownList.Items.Insert(0, new ListItem("", ""));
                DistrictDropDownList.Items.Add(new ListItem("前鎮區", "前鎮區"));
                DistrictDropDownList.Items.Add(new ListItem("前金區", "前金區"));
                DistrictDropDownList.Items.Add(new ListItem("小港區", "小港區"));
                DistrictDropDownList.Items.Add(new ListItem("大樹區", "大樹區"));
                DistrictDropDownList.Items.Add(new ListItem("鳳山區", "鳳山區"));


                // 添加其他屏東縣行政區選項
            }
            // 添加其他縣市的行政區選項

            // 清空院別選項
            ClinicNameDropDownList.Items.Clear();
        }

    </script>

</head>


<body>


    <form id="form1" runat="server" class="num-form-container">
        <div class="form-tittle">
            <div class="tittle">預約掛號<a href="pet.aspx"><i class="fa fa-times close-icon" id="closeIcon"></i></a></div>

            <div class="num-content">

                <div class="num-box-1">
                    <div class="num-box-a">
                        <span class="num-tittle">請選擇縣市</span>
                        <asp:DropDownList ID="CityDropDownList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="CityDropDownList_SelectedIndexChanged">
                            <asp:ListItem Value="" Text="" />
                            <asp:ListItem Value="高雄市" Text="高雄市" />
                            <asp:ListItem Value="屏東縣" Text="屏東縣" />
                            
                        </asp:DropDownList>
                    </div>
                    <div class="num-box-a">
                        <span class="num-tittle">請選擇行政區</span>
                        <asp:DropDownList ID="DistrictDropDownList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DistrictDropDownList_SelectedIndexChanged">
                            <asp:ListItem Value="" Text="" />
                        </asp:DropDownList>
                    </div>
                    <div class="num-box-a">
                        <span class="num-tittle">請選擇診所</span>
                        <asp:DropDownList ID="ClinicNameDropDownList" runat="server">
                            <asp:ListItem Value="" Text="" />
                        </asp:DropDownList>
                    </div>
                    <div class="num-box-a">
                        <span class="num-tittle">請選擇日期</span>
                        <asp:TextBox ID="AppointmentDateTextBox" type="date" runat="server"></asp:TextBox>
                    </div>
                    <div class="num-box-a">
                        <span class="num-tittle">請選擇時間</span>
                        <asp:DropDownList ID="AppointmentTimeTextBox" runat="server">
                            <asp:ListItem Value="" Text="" />
                            <asp:ListItem Value="A" Text="08:00~09:00" />
                            <asp:ListItem Value="B" Text="09:00~10:00" />
                            <asp:ListItem Value="C" Text="10:00~11:00" />
                            <asp:ListItem Value="D" Text="11:00~12:00" />
                            <asp:ListItem Value="E" Text="12:00~13:00" />
                            <asp:ListItem Value="F" Text="13:00~14:00" />
                            <asp:ListItem Value="G" Text="14:00~15:00" />
                            <asp:ListItem Value="H" Text="15:00~16:00" />
                            <asp:ListItem Value="I" Text="16:00~17:00" />
                            <asp:ListItem Value="J" Text="17:00~18:00" />
                            <asp:ListItem Value="K" Text="18:00~19:00" />
                            <asp:ListItem Value="L" Text="19:00~20:00" />
                            <asp:ListItem Value="M" Text="20:00~21:00" />
                            <asp:ListItem Value="N" Text="21:00~22:00" />
                            <asp:ListItem Value="O" Text="22:00~23:00" />


                        </asp:DropDownList>
                    </div>
                    <div class="num-box-a">
                        <span class="num-tittle">寵物名字?</span>
                        <asp:DropDownList ID="PetNameDropDownList" runat="server">
                            <asp:ListItem Value="" Text="" />
                        </asp:DropDownList>
                    </div>

                    <div class="num-box-a">
                        <span class="num-tittle">精神狀況?</span>
                        <asp:DropDownList ID="MentalStatusDropDownList" runat="server">
                            <asp:ListItem Value="" Text="" />
                            <asp:ListItem Value="很好" Text="很好" />
                            <asp:ListItem Value="普通" Text="普通" />
                            <asp:ListItem Value="很差" Text="很差" />
                        </asp:DropDownList>
                    </div>

                    <div class="num-box-a">
                        <span class="num-tittle">食慾狀況?</span>
                        <asp:DropDownList ID="AppetiteDropDownList" runat="server">
                            <asp:ListItem Value="" Text="" />
                            <asp:ListItem Value="良好" Text="良好" />
                            <asp:ListItem Value="普通" Text="普通" />
                            <asp:ListItem Value="很差" Text="很差" />
                        </asp:DropDownList>
                    </div>

                    <div class="num-box-a">
                        <span class="num-tittle">飲水狀況?</span>
                        <asp:DropDownList ID="DrinkingDropDownList" runat="server">
                            <asp:ListItem Value="" Text="" />
                            <asp:ListItem Value="很好" Text="很好" />
                            <asp:ListItem Value="普通" Text="普通" />
                            <asp:ListItem Value="很差" Text="很差" />
                        </asp:DropDownList>
                    </div>

                    <div class="num-box-a">
                        <span class="num-tittle">呼吸狀況?</span>
                        <asp:DropDownList ID="BreathingDropDownList" runat="server">
                            <asp:ListItem Value="" Text="" />
                            <asp:ListItem Value="不會喘" Text="不會喘" />
                            <asp:ListItem Value="有時會喘" Text="有時會喘" />
                            <asp:ListItem Value="經常很喘" Text="經常很喘" />
                        </asp:DropDownList>
                    </div>

                    <div class="num-box-a">
                        <span class="num-tittle">排便狀況? </span>
                        <asp:DropDownList ID="DefecationDropDownList" runat="server">
                            <asp:ListItem Value="" Text="" />
                            <asp:ListItem Value="良好" Text="良好" />
                            <asp:ListItem Value="普通" Text="普通" />
                            <asp:ListItem Value="便祕" Text="便秘" />
                        </asp:DropDownList>
                    </div>

                    <div class="num-box-a">
                        <span class="num-tittle">排尿狀況?</span>
                        <asp:DropDownList ID="UrinationDropDownList" runat="server">
                            <asp:ListItem Value="" Text="" />
                            <asp:ListItem Value="很好" Text="很好" />
                            <asp:ListItem Value="普通" Text="普通" />
                            <asp:ListItem Value="很差" Text="很差" />
                        </asp:DropDownList>
                    </div>

                    <div class="num-box-a">
                        <span class="num-tittle">皮膚狀況? </span>
                        <asp:DropDownList ID="SkinDropDownList" runat="server">
                            <asp:ListItem Value="" Text="" />
                            <asp:ListItem Value="正常" Text="正常" />
                            <asp:ListItem Value="有時搔癢" Text="有時搔癢" />
                            <asp:ListItem Value="經常搔癢" Text="經常搔癢" />
                        </asp:DropDownList>
                    </div>
                </div>
                <!-- 其他下拉選單控制項 -->
                <div class="num-box-2">
                    <div class="num-box-b">
                        <span class="num-tittle">是否有氣味？</span>

                        是
            <asp:RadioButton ID="RadioButton1" runat="server" GroupName="Odor" />
                        否
            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="Odor" />
                    </div>
                </div>

                <div class="num-box-3">
                    <div class="num-box-c">
                        <span class="num-tittle">看診中因為動物不會自己表達，如果因需要血檢丶X光丶超音波檢查是否同意接受進階的醫療？ </span>

                        是
            <asp:RadioButton ID="RadioButton3" runat="server" GroupName="Advanced" />
                        否
            <asp:RadioButton ID="RadioButton4" runat="server" GroupName="Advanced" />
                    </div>
                    <div class="num-box-c">
                        <span class="num-tittle">看診中若需要做檢查(如血檢丶X光丶超音波) 或特殊的藥物是否需要提前報價，或是選擇最適當藥物後再進行報價? </span>

                        是
            <asp:RadioButton ID="RadioButton5" runat="server" GroupName="Quotation" />
                        否
            <asp:RadioButton ID="RadioButton6" runat="server" GroupName="Quotation" />
                    </div>
                    <div class="num-btn-container">
                        <asp:Button ID="Button1" runat="server" Text="預約" OnClick="Button1_Click" class="num-btn" />
                    </div>
                </div>
            </div>
        </div>
       

    </form>
</body>
</html>
