<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>User Registeration - Oman United</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headend" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderPlaceHolder" Runat="Server">
    <section id="title-bar">
        <asp:SiteMapPath ID="Breadcrumb" CssClass="breadcrumb" runat="server" SkipLinkText="" SiteMapProvider="SiteMapPath">
            <RootNodeTemplate><a href="<%= SiteMap.RootNode.Url %>">Home</a></RootNodeTemplate>
            <CurrentNodeTemplate></CurrentNodeTemplate>
        </asp:SiteMapPath>
        <h2>Registeration</h2>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="script" runat="server" />
       <section class="contact-us">
        <section id="content" class="boxed-container">
            <h3 class="no-margin-top">Please enter your details in all required fields</h3>
            <fieldset id="register-form" class="no-border no-padding">
            <asp:Label ID="lbl_msg" runat="server" Text="" />
                <div class="row">
                    <div class="col one-half">
                        <asp:TextBox ID="FName" runat="server" Placeholder="First Name" />
                        <asp:RequiredFieldValidator ID="req_fname" ControlToValidate="FName" runat="server" ErrorMessage="Please enter your first name" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_fname" runat="server" TargetControlID="req_fname" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                        <asp:RegularExpressionValidator ID="reg_fname" ControlToValidate="FName" runat="server" ErrorMessage="Only alphabets are allowed" ValidationExpression="^[a-zA-Z ]*$" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_regfname" runat="server" TargetControlID="reg_fname" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                    </div>
                    <div class="col one-half last">
                        <asp:TextBox ID="LName" runat="server" Placeholder="Last Name" />
                        <asp:RequiredFieldValidator ID="req_lname" ControlToValidate="LName" runat="server" ErrorMessage="Please enter your last name" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_lname" runat="server" TargetControlID="req_lname" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                        <asp:RegularExpressionValidator ID="reg_lname" ControlToValidate="LName" runat="server" ErrorMessage="Only alphabets are allowed" ValidationExpression="^[a-zA-Z ]*$" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_reglname" runat="server" TargetControlID="reg_lname" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                    </div>
                </div>
                <div class="row">
                    <div class="col one-half">
                        <asp:TextBox ID="Email" runat="server" Placeholder="Email" />
                        <asp:RequiredFieldValidator ID="req_email" ControlToValidate="Email" runat="server" ErrorMessage="Please enter your email" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_email" runat="server" TargetControlID="req_email" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                        <asp:RegularExpressionValidator ID="reg_email" ControlToValidate="Email" runat="server" ErrorMessage="Incorrent. Email must be in name@doman.com format" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_regemail" runat="server" TargetControlID="reg_email" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                    </div>
                    <div class="col one-half last">
                        <asp:TextBox ID="cEmail" runat="server" Placeholder="Confirm Email" />
                        <asp:RequiredFieldValidator ID="req_cemail" ControlToValidate="cEmail" runat="server" ErrorMessage="Please confirm your email" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_cemail" runat="server" TargetControlID="req_cemail" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                        <asp:RegularExpressionValidator ID="reg_cemail" ControlToValidate="cEmail" runat="server" ErrorMessage="Incorrent. Email must be in name@doman.com format" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_regcemail" runat="server" TargetControlID="reg_cemail" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                        <asp:CompareValidator ID="comp_cemail" runat="server" ErrorMessage="Confirmatin is not consistant with email entered in the previous field" ControlToValidate="cEmail" ControlToCompare="Email" Type="String" Operator="Equal" Display="None" />
                        <asp:ValidatorCalloutExtender ID="cout_compemail" runat="server" TargetControlID="comp_cemail" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                    </div>
                </div>
              <div class="row">
                    <div class="col one-half">
                        <asp:TextBox ID="Password" runat="server" Placeholder="Password" TextMode="Password" />
                        <asp:RequiredFieldValidator ID="req_pass" ControlToValidate="Password" runat="server" ErrorMessage="Please enter a password for your account" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_reqpass" runat="server" TargetControlID="req_pass" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                        <asp:RegularExpressionValidator ID="reg_pass" ControlToValidate="Password" runat="server" ErrorMessage="Password must contain at least 8 characters, at least 1 letter and 1 number" ValidationExpression="^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{8,}$" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_regpass" runat="server" TargetControlID="reg_pass" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                    </div>
                    <div class="col one-half last">
                        <asp:TextBox ID="cPassword" runat="server" Placeholder="Confirm Password" TextMode="Password" />
                        <asp:RequiredFieldValidator ID="req_cpass" ControlToValidate="cPassword" runat="server" ErrorMessage="Please confirm your password" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_reqcpass" runat="server" TargetControlID="req_cpass" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                        <asp:RegularExpressionValidator ID="reg_cpass" ControlToValidate="cPassword" runat="server" ErrorMessage="Password must contain at least 8 characters, at least 1 letter and 1 number" ValidationExpression="^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{8,}$" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_regcpass" runat="server" TargetControlID="reg_cpass" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                        <asp:CompareValidator ID="comp_cpass" runat="server" ErrorMessage="Password miss match" ControlToValidate="cPassword" ControlToCompare="Password" Type="String" Operator="Equal" Display="None" />
                        <asp:ValidatorCalloutExtender ID="cout_compcpass" runat="server" TargetControlID="comp_cpass" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                    </div>
                </div>
              <div class="row">
                    <div class="col one-half">
                        <asp:DropDownList ID="Gender" runat="server" CssClass="select-menu">
                            <asp:ListItem Value="0" Text="-- Select Gender --" />
                            <asp:ListItem Value="F" Text="Female" />
                            <asp:ListItem Value="M" Text="Male" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="req_gender" ControlToValidate="Gender" runat="server" ErrorMessage="Please enter a gender" InitialValue="0" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_gender" runat="server" TargetControlID="req_gender" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                    </div>
                    <div class="col one-half last">
                        <asp:TextBox ID="DoB" runat="server" Placeholder="Date of Birth" TextMode="Date"/>
                        <asp:RequiredFieldValidator ID="req_dob" ControlToValidate="DoB" runat="server" ErrorMessage="Please confirm your date of birth" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_reqdob" runat="server" TargetControlID="req_dob" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                    </div>
                </div>
                <div class="row">
                    <asp:CheckBox ID="confirmterms" runat="server" Text="Accept <a href='terms.aspx'>Terms and Conditions</a>" />
                    <asp:CustomValidator ID="req_terms" runat="server" ErrorMessage="You have to accept our terms and conditions" OnServerValidate="validateCheckBoxes_ServerValidate" Display="Dynamic" CssClass="error-msg" />
                </div>
                <div class="row">
                    <asp:Button ID="reg_account" CssClass="plain-button" runat="server" Text="Register" OnClick="btn_reg_Click"/>
                </div>
            </fieldset>
        </section>
        <aside id="sidebar">
            <div id="contact-widget" class="boxed-container">
                <h3 class="widget-title">Already have an account?<br /> Please login</h3>
                <p>
                    <a href="login.aspx" class="plain-button full-width">Login</a>
                </p>
            </div>
        </aside>
    </section>

</asp:Content>

