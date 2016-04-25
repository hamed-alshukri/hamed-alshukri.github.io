<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="support-ticket.aspx.cs" Inherits="support_ticket" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>Support Tickets - Oman United</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headend" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderPlaceHolder" Runat="Server">
    <section id="title-bar">
        <asp:SiteMapPath ID="Breadcrumb" CssClass="breadcrumb" runat="server" SkipLinkText="">
            <RootNodeTemplate><a href="<%= SiteMap.RootNode.Url %>">Home</a></RootNodeTemplate>
            <CurrentNodeTemplate></CurrentNodeTemplate>
        </asp:SiteMapPath>
        <h2><%= SiteMap.CurrentNode.Title %></h2>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="script" runat="server" />
    <section class="boxed-container">
        <asp:Label ID="lbl_msg" runat="server" Text="" ForeColor="Red"/>
            <fieldset id="contact-form" class="no-border no-padding">
                <div class="row">
                    <div class="col one-half">
                        <asp:TextBox ID="name" runat="server" Placeholder="Full Name" />
                        <asp:RequiredFieldValidator ID="req_name" ControlToValidate="name" runat="server" ErrorMessage="Please enter your full name" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_name" runat="server" TargetControlID="req_name" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                        <asp:RegularExpressionValidator ID="reg_name" ControlToValidate="name" runat="server" ErrorMessage="Only alphabets are allowed" ValidationExpression="^[a-zA-Z ]*$" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_regname" runat="server" TargetControlID="reg_name" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                    </div>
                    <div class="col one-half last">
                        <asp:TextBox ID="phone" runat="server" Placeholder="Phone Number (optional)" />
                        <asp:RegularExpressionValidator ID="reg_phone" ControlToValidate="phone" runat="server" ErrorMessage="Phone number must be in the following format: +968 0000 0000" ValidationExpression="^[1-9]{1}\d{7}" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_regphone" runat="server" TargetControlID="reg_phone" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                    </div>
                </div>
                <div class="row">
                    <div class="col one-half">
                        <asp:TextBox ID="email" runat="server" Placeholder="Email" />
                        <asp:RequiredFieldValidator ID="req_email" ControlToValidate="email" runat="server" ErrorMessage="Please enter your email" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_email" runat="server" TargetControlID="req_email" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                        <asp:RegularExpressionValidator ID="reg_email" ControlToValidate="email" runat="server" ErrorMessage="Incorrent. Email must be in name@doman.com format" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_regemail" runat="server" TargetControlID="reg_email" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                    </div>
                    <div class="col one-half last">
                        <asp:TextBox ID="cemail" runat="server" Placeholder="Confirm Email" />
                        <asp:RequiredFieldValidator ID="req_cemail" ControlToValidate="cemail" runat="server" ErrorMessage="Please confirm your email" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_cemail" runat="server" TargetControlID="req_cemail" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                        <asp:CompareValidator ID="comp_cemail" runat="server" ControlToValidate="cemail" ControlToCompare="email" Type="String" Operator="Equal" ErrorMessage="Email does not match" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_compemail" runat="server" TargetControlID="comp_cemail" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                        <asp:RegularExpressionValidator ID="reg_cemail" ControlToValidate="cemail" runat="server" ErrorMessage="Incorrent. Email must be in name@doman.com format" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_regcemail" runat="server" TargetControlID="reg_cemail" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                    </div>
                </div>
                <div class="row">
                    <div class="col one-half">
                        <asp:TextBox ID="subject" runat="server" Placeholder="Subject" />
                        <asp:RequiredFieldValidator ID="req_subject" ControlToValidate="subject" runat="server" ErrorMessage="Please enter a subject" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_subject" runat="server" TargetControlID="req_subject" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                        <asp:RegularExpressionValidator ID="reg_subject" ControlToValidate="subject" runat="server" ErrorMessage="Only alphanumerics are allowed in subject" ValidationExpression="^[a-zA-Z ]*$" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_regsubject" runat="server" TargetControlID="reg_subject" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                    </div>
                    <div class="col one-half last">
                        <asp:DropDownList ID="dept" runat="server" CssClass="select-menu">
                            <asp:ListItem Text="-- Select Department --" Value="0" /> 
                            <asp:ListItem Text="Finance" Value="finance" />
                            <asp:ListItem Text="Customer Service" Value="customer_service" />
                            <asp:ListItem Text="Claims" Value="claims" />
                            <asp:ListItem Text="Insurance" Value="insurance" />
                            <asp:ListItem Text="Other" Value="other" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="req_dept" ControlToValidate="dept" runat="server" ErrorMessage="Please select a department" Display="None" SetFocusOnError="true" InitialValue="0" />
                        <asp:ValidatorCalloutExtender ID="cout_dept" runat="server" TargetControlID="req_dept" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" Width="250" />
                    </div>
                </div>
                <div class="row">
                    <asp:TextBox ID="message" runat="server" height="250px" Placeholder="Message" textmode="multiline"/>
                        <asp:RequiredFieldValidator ID="req_msg" ControlToValidate="message" runat="server" ErrorMessage="Please enter your message" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_msg" runat="server" TargetControlID="req_msg" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                </div>
                <div class="row">
                    <asp:Button ID="send" CssClass="plain-button" runat="server" Text="Submit Ticket" OnClick="btn_tckt_Click" />
                </div>
            </fieldset>
    </section>
    <section class="cta">
        <div class="col three-fourths cta-text">
            We have handcrafted an insurance policy calculator specially for our valuable customers. Try it now and get an estimated price for the selected insurance policy.
        </div>
        <div class="col one-fourth last">
            <a href="calculator.aspx" class="plain-button cta-button alignright">
                Try Our Calculator
            </a>
        </div>
    </section>
</asp:Content>

