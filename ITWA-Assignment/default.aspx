<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>Oman United - Insurance for everyone</title>
    <link href="css/flexslider.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="headend" Runat="Server">
    <script src="js/jquery.flexslider.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderPlaceHolder" Runat="Server">
    <div id="slider">
        <div class="flexslider">
          <ul class="slides">
            <li>
                <img src="img/slide-1.jpg" alt="Vehicle Insurance" />
                <div class="flex-caption">
                    <h4>Vehicle Insurance</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>
            </li>
            <li>
                <img src="img/slide-2.jpg" alt="Building Insurance" />
                <div class="flex-caption">
                    <h4>Building Insurance</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>
            </li>
            <li>
                <img src="img/slide-3.jpg" alt="Travel Insurance" />
                <div class="flex-caption">
                    <h4>Travel Insurance</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>
            </li>
            <li>
                <img src="img/slide-4.jpg" alt="Health Insurance" />
                <div class="flex-caption">
                    <h4>Health Insurance</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>
            </li>
          </ul>
        </div>
        <div id="shadow"></div>
        <div class="clearfix"></div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section>
        <div class="row clearfix">
            <div class="boxed-container col one-fourth icon">
                <i class="fa fa-building"></i>
                <h4 class="text-center"><a href="insurance-building.aspx">Building Insurance</a></h4>
                <p>
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,
                </p>
            </div>
            <div class="boxed-container col one-fourth icon">
                <i class="fa fa-heartbeat"></i>
                <h4 class="text-center"><a href="insurance-health.aspx">Health Insurance</a></h4>
                <p>
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,
                </p>
            </div>
            <div class="boxed-container col one-fourth icon">
                <i class="fa fa-briefcase"></i>
                <h4 class="text-center"><a href="insurance-travel.aspx">Travel Insurance</a></h4>
                <p>
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,
                </p>
            </div>
            <div class="boxed-container col one-fourth icon last">
                <i class="fa fa-car"></i>
                <h4 class="text-center"><a href="insurance-vehicle.aspx">Vehicle Insurance</a></h4>
                <p>
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,
                </p>
            </div>
        </div>
        <div class="row cta clearfix">
            <div class="col three-fourths cta-text">
                We have handcrafted an insurance policy calculator specially for our valuable customers. Try it now and get an estimated price for the selected insurance policy.
            </div>
            <div class="col one-fourth last">
                <a href="calculator.aspx" class="plain-button cta-button alignright">
                    Try Our Calculator
                </a>
            </div>
        </div>
        <div class="row clearfix">
            <div class="recent-news boxed-container col one-half">
                <h4 class="text-left">Recent News</h4>
                <table id="news-table">
                    <tr>
                        <td class="news-date">October 2015</td>
                        <td class="news-title">Won Best Company Award 2015.</td>
                    </tr>
                    <tr>
                        <td class="news-date">May 2015</td>
                        <td class="news-title">Free Health Insurance for new customer.</td>
                    </tr>
                    <tr>
                        <td class="news-date">February 2015</td>
                        <td class="news-title">Change in te.rms and conditions</td>
                    </tr>
                    <tr>
                        <td class="news-date">December 2014</td>
                        <td class="news-title">Won Best Customer Service Award 2014.</td>
                    </tr>
                </table>
            </div>
            <div class="newsletter boxed-container col one-half last">
                <h4 class="text-left">Newsletter</h4>
                <p>Subscribe to our newsletter to get our news, promotions, and notifications delivered to your inbox</p>
                <div class="row">
                    <div class="col one-half">
                        <asp:TextBox ID="TextBox1" runat="server" placeholder="Your Name"></asp:TextBox>
                    </div>
                    <div class="col one-half last">
                        <asp:TextBox ID="TextBox2" runat="server" placeholder="Your Email"></asp:TextBox>
                    </div>
                </div>
                <asp:Button ID="Button1" CssClass="plain-button" runat="server" Text="Subscribe" />
            </div>
        </div>
    </section>
</asp:Content>

