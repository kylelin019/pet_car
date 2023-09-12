<%@ Page Language="C#" AutoEventWireup="true" CodeFile="clinic_map.aspx.cs" Inherits="clinic_map" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>醫院據點</title>

    <link rel="stylesheet" href="css/clinic_map.css" />

    <!-- --------- Owl-Carousel ------------------->
    <link rel="stylesheet" href="./css/owl.carousel.min.css" />
    <link rel="stylesheet" href="./css/owl.theme.default.min.css" />

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin="" />
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>

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
    <!--------clinic-Section------------------>
    <section id="clinic">

        <!-----------Content----------------->
        <div class="clinic-content">
            <!--**text****************-->
            <div class="clinic-text">
                <h1>動物醫院據點</h1>
                <p>整合地圖功能，顯示鄰近寵物診所位置及相關資訊，協助飼主快速找到合適的寵物診所.</p>
                <!--btns-->
                <div class="clinic-text-btns">

                    <a href="appoint_num.aspx"><i class="fa-solid fa-check"></i>預約掛號</a>
                </div>
            </div>
            <!--**img*****************-->
            <div class="clinic-img">
                <img src="image/clinic_map.png" alt="" />
            </div>
        </div>
    </section>
  
    <form id="form1" runat="server" class="appointment-search">
        <!----appointment-search----------------->
      <div class="appointment-search-container">
        <h3>Find Best PetCare</h3>

        <div class="appo-search-drop" runat="server">
            <div class="column">
                <div class="appo-box-a">
                    <span class="appo-tittle">請選擇縣市</span>
                    <asp:DropDownList ID="CityDropDownList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="CityDropDownList_SelectedIndexChanged">
                        <asp:ListItem Value="" Text="" />
                        <asp:ListItem Value="高雄市" Text="高雄市" />
                        <asp:ListItem Value="屏東縣" Text="屏東縣" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="column">
                <div class="appo-box-a">
                    <span class="appo-tittle">請選擇行政區</span>
                    <asp:DropDownList ID="DistrictDropDownList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DistrictDropDownList_SelectedIndexChanged">
                        <asp:ListItem Value="" Text="" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="column">
                <div class="appo-box-a">
                    <span class="appo-tittle">請選擇診所</span>
                    <asp:DropDownList ID="ClinicNameDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ClinicNameDropDownList_SelectedIndexChanged">
                        <asp:ListItem Value="" Text="" />
                    </asp:DropDownList>

                </div>
            </div>
                <!--**btn*********************-->
            
         </div>
          
      </div>
      
            <br />          
    </form>
     <!----appointment-search------------------------->   
    <main>
        <!-- --------------------- Clinic ----------------- -->
          <br /><br />      
        <!-- Second Carousel -->
        <section class="intro-2">
            <div class="blog">
                <div class="center-content" data-aos-delay="240" data-aos-duration="5000">
                    <h2 class="clinic-h2"><b>合作</b>動物醫院</h2>
                    <p class="clinic-p">Cooperative Animal Hospital</p>
                </div>

                <div class="clinic-container">
                    <div class="owl-carousel owl-theme blog-post">
                        <div class="blog-content" data-aos="fade-up" data-aos-delay="240" data-aos-duration="5000">
                            <img src="./image/image1.png" alt="post-1" />
                          <div class="blog-title">
                                <h3>屏大獸醫院</h3>
                               <a href="tel:081234567"><span class="phone-number">08-1234567</span></a>
                                <span>屏東縣屏東市民生東路</span>
                                <a href="clinic26.aspx">
                                    <button class="more">More</button></a>
                            </div>
                        </div>
                          <div class="blog-content" data-aos="fade-up" data-aos-delay="240">
                            <img src="./image/image1.png" alt="post-1" />
                            <div class="blog-title">
                                <h3>毛寶寶獸醫醫院</h3>
                                 <a href="tel:075784698"><span class="phone-number">07-5784698</span></a>   
                                <span>高雄鳳山區光復路二段</span>
                                <a href="clinic26.aspx">
                                    <button class="more">More</button></a>
                            </div>
                        </div>                    
                        <div class="blog-content" data-aos="fade-up" data-aos-delay="240">
                            <img src="./image/image1.png" alt="post-1" />
                            <div class="blog-title">
                                <h3>醫心動物醫院</h3>
                                 <a href="tel:075976431"><span class="phone-number">07-5976431</span></a>             
                                <span>高雄市前鎮區一心二路</span>
                                <a href="clinic26.aspx">
                                    <button class="more">More</button></a>
                            </div>
                        </div>
                        <div class="blog-content" data-aos="fade-up" data-aos-delay="240">
                            <img src="./image/image1.png" alt="post-1" />
                            <div class="blog-title">
                                <h3>貳勝獸醫動物醫院</h3>
                                 <a href="tel:074698731"><span class="phone-number">07-4698731</span></a>   
                                <span>高雄市小港區沿海一路</span>
                                <a href="clinic26.aspx">
                                    <button class="more">More</button></a>
                            </div>
                        </div>     
                         <div class="blog-content" data-aos="fade-up" data-aos-delay="240">
                            <img src="./image/image1.png" alt="post-1" />
                            <div class="blog-title">
                                <h3>廣動醫院</h3>
                                <a href="tel:088256999"><span class="phone-number">08-8256999</span></a>                                
                                <span>屏東縣屏東市復興南路一段</span>
                                <a href="clinic26.aspx">
                                    <button class="more">More</button></a>
                            </div>
                        </div>
                         <div class="blog-content" data-aos="fade-up" data-aos-delay="240">
                            <img src="./image/image1.png" alt="post-1" />
                            <div class="blog-title">
                                <h3>屏小獸醫院</h3>
                                 <a href="tel:087654321"><span class="phone-number">08-7654321</span></a>   
                                <span>屏東縣屏東市大武路</span>
                                <a href="clinic26.aspx">
                                    <button class="more">More</button></a>
                            </div>
                        </div>
                         <div class="blog-content" data-aos="fade-up" data-aos-delay="240">
                            <img src="./image/image1.png" alt="post-1" />
                            <div class="blog-title">
                                <h3>屏中貓狗醫院</h3>
                                 <a href="tel:087541966"><span class="phone-number">08-7541966</span></a>   
                                <span>屏東縣萬丹鄉中興路二段</span>
                                <a href="clinic26.aspx">
                                    <button class="more">More</button></a>
                            </div>
                        </div>
                         <div class="blog-content" data-aos="fade-up" data-aos-delay="240">
                            <img src="./image/image1.png" alt="post-1" />
                            <div class="blog-title">
                                <h3>馬雷動物醫院</h3>
                                 <a href="tel:089786352"><span class="phone-number">08-9786352</span></a>   
                                <span>屏東縣潮州鎮</span>
                                <a href="clinic26.aspx">
                                    <button class="more">More</button></a>
                            </div>
                        </div>
                         <div class="blog-content" data-aos="fade-up" data-aos-delay="240">
                            <img src="./image/image1.png" alt="post-1" />
                            <div class="blog-title">
                                <h3>泰克爾貓狗醫院</h3>
                                 <a href="tel:076976431"><span class="phone-number">07-6976431</span></a>   
                                <span>高雄市前金區中華三路</span>
                                <a href="clinic26.aspx">
                                    <button class="more">More</button></a>
                            </div>
                        </div>                     
                          <div class="blog-content" data-aos="fade-up" data-aos-delay="240">
                            <img src="./image/image1.png" alt="post-1" />
                            <div class="blog-title">
                                <h3>高菲動物醫院</h3>
                                 <a href="tel:071111123"><span class="phone-number">07-1111123</span></a>   
                                <span id="clinic-address">高雄市九曲堂九曲路</span>
                                <a href="clinic26.aspx">
                                    <button class="more">More</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="owl-navigation blog-navigation">
                        <span class="owl-nav-prev" data-aos="fade-up" data-aos-delay="100"><i class="fas fa-long-arrow-alt-left"></i></span>
                        <span class="owl-nav-next" data-aos="fade-up" data-aos-delay="100"><i class="fas fa-long-arrow-alt-right"></i></span>
                    </div>
                </div>
            </div>
        </section>

      <section>
        <h1 class="map-h1" data-aos="fade-up" data-aos-delay="90">動物醫院據點</h1> 
        <p class="clinic-p" data-aos="fade-up" data-aos-delay="90">Animal Hospital Locations</p>
        <div id="map"></div>                 
      </section>    
  
      </main>

      <script>
          const map = L.map('map');
          map.setView([22.6235, 120.4343], 13);

          L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
              attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
          }).addTo(map);

          const data = {
              clinic26: {
                  coords: [22.62940, 120.34296],
                  title: "毛寶寶獸醫診所",
                  address: ' 高雄鳳山區光復路二段. ',
                  phone: '075784698',
                  link: 'clinic26.aspx'
              },
              clinic03: {
                  coords: [22.58362, 120.48793],
                  title: "屏中貓狗診所",
                  address: ' 屏東縣萬丹鄉中興路二段.',
                  phone: '087541966',
                  link: 'connect.aspx'
              },
              clinic23: {
                  coords: [22.62631, 120.29697],
                  title: "泰克爾貓狗診所",
                  address: ' 高雄市前金區中華三路.',
                  phone: '077541966',
                  link: 'index.aspx'
              },
              clinic29: {
                  coords: [22.6549, 120.5195],
                  title: "馬雷動物醫院",
                  address: ' 屏東縣麟洛鄉中山路.',
                  phone: '089786352',
                  link: 'register.aspx'
              },
              clinic01: {
                  coords: [22.65900, 120.51303],
                  title: "屏大獸醫診所",
                  address: ' 屏東縣屏東市民生東路.',
                  phone: 081234567,
                  link: 'healthy.aspx'
              },
              clinic18: {
                  coords: [22.61185, 120.30922],
                  title: "醫心動物醫院",
                  address: ' 高雄市前鎮區一心二路.',
                  phone: '075976431',
                  link: 'appoint_num.aspx'
              },
              clinic2: {
                  coords: [22.66007, 120.47305],
                  title: "屏小獸醫院",
                  address: '屏東縣屏東市大武路.',
                  phone: ' 087654321',
                  link: 'index.aspx.aspx'
              },          
              clinic4: {
                  coords: [22.65578, 120.42294],
                  title: "高菲動物醫院",
                  address: '高雄市九曲堂九曲路.',
                  phone: '071111123',
                  link: 'index.aspx.aspx'
              },
              clinic11: {
                  coords: [22.65138, 120.48601],
                  title: "廣動動物醫院",
                  address: '屏東縣屏東市復興南路一段.',
                  phone: ' 088256999',
                  link: 'appoint_search.aspx'
              },
              clinic21: {
                  coords: [22.56470, 120.35382],
                  title: "貳勝獸醫動物醫院",
                  address: '高雄市小港區沿海一路.',
                  phone: '074698731',
                  link: 'appoint_search.aspx'
              },
          };

          const customIcon = L.icon({
              iconUrl: './image/map.svg',
              iconSize: [50, 50],
          })


          for (let key in data) {
              const clinic = data[key];

              const marker = L.marker(clinic.coords, {
                  title: clinic.title,
                  icon: customIcon,
              })
                  .addTo(map);

              marker.bindPopup(
                  `<span class="popup" style="margin-top: 20px; margin-bottom: 20px;">
                 <strong style="font-size: 20px;">${clinic.title}</strong><br/>
                <span style="font-size: 18px;">${clinic.address}</span><br/>                        
                Cell: <a href="tel:${clinic.phone}" style="font-size: 18px;">${clinic.phone}</a>

                 </span>`
              );

              marker.on('mouseover', function () {
                  marker.openPopup();
              });

              marker.on('mouseout', function () {
                  marker.closePopup();
              });
              marker.on('click', function () {
                  window.location.href = clinic.link; // 使用跳转链接属性
              });
          }
          // Add this code to your existing JavaScript code

          // Select all address spans with the class "clinic-address"
          const addressSpans = document.querySelectorAll('.clinic-address');

          // Add a click event listener to each address span
          addressSpans.forEach((addressSpan) => {
              addressSpan.addEventListener('click', function () {
                  // Get the text content of the clicked address span
                  const addressText = addressSpan.textContent.trim();

                  // Search for the corresponding clinic data based on the address text
                  let clinicData = null;
                  for (let key in data) {
                      if (data[key].address === addressText) {
                          clinicData = data[key];
                          break;
                      }
                  }

                  // If clinic data is found, update the map's view to the clinic's coordinates
                  if (clinicData) {
                      map.setView(clinicData.coords, 13);
                  }
              });
          });


// Add similar event listeners for other addresses

      </script>

    <br />
    <br />
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



    <!-- Jquery Library file -->
    <script src="scripts/jquery-3.7.0.js"></script>

    <!-- --------- Owl-Carousel js ------------------->
    <script src="./scripts/owl.carousel.min.js"></script>

    <!-- Custom Javascript file -->
    <script src="./scripts/main.js"></script>
    <!-- ------------ AOS js Library  ------------------------- -->
    <script src="./scripts/aos.js"></script>

</body>
</html>
