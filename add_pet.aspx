<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_pet.aspx.cs" Inherits="add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>新增寵物</title>
    <link rel="stylesheet" href="css/Login.css" />
    <link rel="stylesheet" href="css/Add_pet.css" />
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

    <style>
        @import url("https://fonts.googleapis.com/css?family=Noto+Sans+TC:100,300,400,500,700,900&display=swap");
        @import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css");
    </style>

    <script runat="server">
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 取得當前年份
                int currentYear = DateTime.Now.Year;

                // 動態生成年份選項，從當前年份倒退到2003年
                for (int year = currentYear; year >= 2003; year--)
                {
                    YearDropDownList.Items.Add(new ListItem(year.ToString(), year.ToString()));
                }
            }
        }
        protected void PetBreedDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedPetBreed = PetTypeDropDownList.SelectedValue;
            string selectedBloodType = PetTypeDropDownList.SelectedValue;

            // 清空之前的選項
            PetBreedDropDownList.Items.Clear();
            BloodTypeDropDownList.Items.Clear();

            if (selectedPetBreed == "犬")
            {
                PetBreedDropDownList.Items.Insert(0, new ListItem("", "")); // 添加空白選項
                PetBreedDropDownList.Items.Add(new ListItem("柯基", "柯基"));
                PetBreedDropDownList.Items.Add(new ListItem("法鬥", "法鬥"));
                PetBreedDropDownList.Items.Add(new ListItem("拉布拉多", "拉布拉多"));
                PetBreedDropDownList.Items.Add(new ListItem("黃金獵犬", "黃金獵犬"));
                PetBreedDropDownList.Items.Add(new ListItem("德國牧羊犬", "德國牧羊犬"));
                PetBreedDropDownList.Items.Add(new ListItem("比熊犬", "比熊犬"));
                PetBreedDropDownList.Items.Add(new ListItem("博美犬", "博美犬"));
                PetBreedDropDownList.Items.Add(new ListItem("西施犬", "西施犬"));
                PetBreedDropDownList.Items.Add(new ListItem("杜賓犬", "杜賓犬"));
                PetBreedDropDownList.Items.Add(new ListItem("貴賓犬", "貴賓犬"));
                PetBreedDropDownList.Items.Add(new ListItem("吉娃娃", "吉娃娃"));
                PetBreedDropDownList.Items.Add(new ListItem("哈士奇", "哈士奇"));
                PetBreedDropDownList.Items.Add(new ListItem("貝格萊犬", "貝格萊犬"));
                PetBreedDropDownList.Items.Add(new ListItem("馬爾濟斯", "馬爾濟斯"));
                PetBreedDropDownList.Items.Add(new ListItem("秋田犬", "秋田犬"));
                PetBreedDropDownList.Items.Add(new ListItem("柴犬", "柴犬"));
                PetBreedDropDownList.Items.Add(new ListItem("松狮犬", "松狮犬"));
                PetBreedDropDownList.Items.Add(new ListItem("雪納瑞", "雪納瑞"));
                PetBreedDropDownList.Items.Add(new ListItem("巴哥犬", "巴哥犬"));
                PetBreedDropDownList.Items.Add(new ListItem("英國鬥牛犬", "英國鬥牛犬"));
                PetBreedDropDownList.Items.Add(new ListItem("羅威那獵犬", "羅威那獵犬"));
                PetBreedDropDownList.Items.Add(new ListItem("斗牛犬", "斗牛犬"));

                BloodTypeDropDownList.Items.Insert(0, new ListItem("", "")); // 添加空白選項
                BloodTypeDropDownList.Items.Add(new ListItem("不清楚", "不清楚"));
                BloodTypeDropDownList.Items.Add(new ListItem("DEA1（-）1.1", "DEA1（-）1.1)"));
                BloodTypeDropDownList.Items.Add(new ListItem("DEA1（-）1.2", "DEA1（-）1.2"));
                BloodTypeDropDownList.Items.Add(new ListItem("DEA1（+）1.1", "DEA1（+）1.1"));
                BloodTypeDropDownList.Items.Add(new ListItem("DEA1（+）1.2", "DEA1（+）1.2"));
                BloodTypeDropDownList.Items.Add(new ListItem("DEA1（+）3", "DEA1（+）3"));
                BloodTypeDropDownList.Items.Add(new ListItem("DEA1（+）4", "DEA1（+)4"));
                BloodTypeDropDownList.Items.Add(new ListItem("DEA1（+）5", "DEA1（+）5"));
                BloodTypeDropDownList.Items.Add(new ListItem("DEA1（+）6", "DEA1（+）6"));
                BloodTypeDropDownList.Items.Add(new ListItem("DEA1（+）7", "DEA1（+）7"));
                BloodTypeDropDownList.Items.Add(new ListItem("DEA1（+）8", "DEA1（+）8"));

            }
            else if (selectedPetBreed == "貓")
            {
                PetBreedDropDownList.Items.Insert(0, new ListItem("", "")); // 添加空白選項
                PetBreedDropDownList.Items.Add(new ListItem("波斯貓", "波斯貓"));
                PetBreedDropDownList.Items.Add(new ListItem("暹羅貓", "暹羅貓"));
                PetBreedDropDownList.Items.Add(new ListItem("布偶貓", "布偶貓"));
                PetBreedDropDownList.Items.Add(new ListItem("英國短毛貓", "英國短毛貓"));
                PetBreedDropDownList.Items.Add(new ListItem("美國短毛貓", "美國短毛貓"));
                PetBreedDropDownList.Items.Add(new ListItem("俄羅斯藍貓", "俄羅斯藍貓"));
                PetBreedDropDownList.Items.Add(new ListItem("孟加拉貓", "孟加拉貓"));
                PetBreedDropDownList.Items.Add(new ListItem("蘇格蘭摺耳貓", "蘇格蘭摺耳貓"));
                PetBreedDropDownList.Items.Add(new ListItem("異國短毛貓", "異國短毛貓"));
                PetBreedDropDownList.Items.Add(new ListItem("波米拉尼亞貓", "波米拉尼亞貓"));
                PetBreedDropDownList.Items.Add(new ListItem("喜馬拉雅貓", "喜馬拉雅貓"));


                BloodTypeDropDownList.Items.Insert(0, new ListItem("", "")); // 添加空白選項
                BloodTypeDropDownList.Items.Add(new ListItem("不清楚", "不清楚"));
                BloodTypeDropDownList.Items.Add(new ListItem("A", "A"));
                BloodTypeDropDownList.Items.Add(new ListItem("B", "B"));
                BloodTypeDropDownList.Items.Add(new ListItem("AB", "AB"));
            }

        }

    </script>

</head>
<body>

    <div class="form-outer-container">
        <form class="register" id="form1" runat="server">
            <div class="form-container">
                <div class="title">新增寵物<a href="pet.aspx"><i class="fa fa-times close-icon" id="closeIcon"></i></a></div>
                 
                <div class="content">

                    <div class="input-group-1">
                        <div class="input-box">
                            <span class="details">寵物名字:</span>
                            <asp:TextBox ID="PetNameTextBox" runat="server" placeholder="寵物名字"></asp:TextBox>
                           
                        </div>
                        <div class="input-box">
                            <span class="details">性別:</span>
                            <asp:DropDownList ID="GendelDropDownList" runat="server" CssClass="gender-dropdown">
                                <asp:ListItem Value="" Text="" />
                                <asp:ListItem Value="公" Text="公" />
                                <asp:ListItem Value="母" Text="母" />
                            </asp:DropDownList>
                        </div>
                        <div class="input-box">
                            <span class="details">貓或狗</span>
                            <asp:DropDownList ID="PetTypeDropDownList" runat="server" CssClass="gender-dropdown" OnSelectedIndexChanged="PetBreedDropDownList_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Value="" Text="" />
                                <asp:ListItem Value="犬" Text="犬" />
                                <asp:ListItem Value="貓" Text="貓" />

                            </asp:DropDownList>
                        </div>
                        <div class="input-box">
                            <span class="details">品種</span>
                            <asp:DropDownList ID="PetBreedDropDownList" runat="server">
                                <asp:ListItem Value="" Text="請先選擇寵物種類" />
                            </asp:DropDownList>
                           
                        </div>
                        <div class="input-box">
                            <span class="details">寵物主要顏色</span>
                            <asp:DropDownList ID="ColorDropDownList" runat="server">
                                <asp:ListItem Value="" Text="" />
                                <asp:ListItem Value="白色" Text="白色" />
                                <asp:ListItem Value="黑色" Text="黑色" />
                                <asp:ListItem Value="灰色" Text="灰色" />
                                <asp:ListItem Value="銀色" Text="銀色" />
                                <asp:ListItem Value="金色" Text="金色" />
                                <asp:ListItem Value="棕色" Text="棕色" />
                                <asp:ListItem Value="橙色" Text="橙色" />
                                <asp:ListItem Value="紅色" Text="紅色" />
                                <asp:ListItem Value="粉紅色" Text="粉紅色" />
                                <asp:ListItem Value="黃色" Text="黃色" />
                                <asp:ListItem Value="綠色" Text="綠色" />
                                <asp:ListItem Value="藍色" Text="藍色" />
                                <asp:ListItem Value="紫色" Text="紫色" />
                            </asp:DropDownList>
                           
                        </div>
                        <div class="input-box">
                            <span class="details">出生年</span>
                            <asp:DropDownList ID="YearDropDownList" runat="server">
                                <asp:ListItem Value="" Text="" />
                            </asp:DropDownList>
                            
                        </div>

                        <div class="input-box">
                            <span class="details">血型:</span>
                            <asp:DropDownList ID="BloodTypeDropDownList" runat="server">
                                <asp:ListItem Value="" Text="請先選擇寵物種類" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="input-group-2">
                        <div class="input-box-2">
                            <span class="details-2">是否定期洗牙?</span>&nbsp;&nbsp;&nbsp;
                            是<asp:RadioButton ID="RadioButton1" runat="server" GroupName="TeethCleaning" />
                            否<asp:RadioButton ID="RadioButton2" runat="server" GroupName="TeethCleaning" AutoPostBack="True" OnCheckedChanged="RadioButton2_CheckedChanged" />
                            <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="#3399FF" Visible="False"></asp:Label>
                        </div>
                        <div class="input-box-2">
                            <span class="details-2">是否定期驅蟲?</span>
                            是<asp:RadioButton ID="RadioButton3" runat="server" GroupName="Deworming" />
                            否<asp:RadioButton ID="RadioButton4" runat="server" GroupName="Deworming" AutoPostBack="True" OnCheckedChanged="RadioButton4_CheckedChanged" />

                            <asp:Label ID="Label2" runat="server" ForeColor="#3399FF" Text="Label" Visible="False"></asp:Label>

                        </div>
                        <div class="input-box-2">
                            <span class="details-2">是否有注射疫苗?</span>
                            是<asp:RadioButton ID="RadioButton5" runat="server" GroupName="Vaccination" />
                            否<asp:RadioButton ID="RadioButton6" runat="server" GroupName="Vaccination" AutoPostBack="True" OnCheckedChanged="RadioButton6_CheckedChanged" />
                            <asp:Label ID="Label3" runat="server" ForeColor="#3399FF" Text="Label" Visible="False"></asp:Label>
                        </div>
                        <div class="input-box-2">
                            <span class="details-2">是否有結紮?</span>&nbsp;&nbsp;&nbsp;
                            是<asp:RadioButton ID="RadioButton7" runat="server" GroupName="Neutered" />
                            否<asp:RadioButton ID="RadioButton8" runat="server" GroupName="Neutered" AutoPostBack="True" />
                            <asp:Label ID="Label4" runat="server" ForeColor="#3399FF" Text="Label" Visible="False"></asp:Label>
                        </div>
                    </div>
                </div>
                <br />
                <div class="centered-container">
                    <asp:Button ID="Button1" runat="server" Text="新增寵物" OnClick="Button1_Click" class="num-btn" OnClientClick="return confirm('確定要新增寵物嗎?請注意，您的寵物一經新增就無法更改!');" />
                </div>

            </div>
        </form>
    </div>
</body>
</html>
