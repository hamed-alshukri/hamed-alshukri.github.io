<%@ Page Title="" Language="C#" MasterPageFile="~/my-account/account.master" AutoEventWireup="true" CodeFile="settings-personal.aspx.cs" Inherits="my_account_settings_personal" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>Update Personal Information - Oman United</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headend" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderPlaceHolder" Runat="Server">
    <section id="title-bar">
        <asp:SiteMapPath ID="Breadcrumb" CssClass="breadcrumb" runat="server" SkipLinkText="" SiteMapProvider="SiteMapPath">
            <RootNodeTemplate><a href="<%= SiteMap.RootNode.Url %>">Home</a></RootNodeTemplate>
            <CurrentNodeTemplate></CurrentNodeTemplate>
        </asp:SiteMapPath>
        <h2>Update Personal Information</h2>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="script" runat="server" />
    <section class="boxed-container">
        <h4>The following detials cannot be edited. In case of incorrect information, please submit a <a href="../support-ticket.aspx">support ticket</a></h4>
                <div class="row">
                    <div class="col one-half">
                        <asp:label runat="server" CssClass="form-label" Text="First Name" />
                        <asp:TextBox ID="FName" runat="server" Enabled="false" CssClass="disabled" />
                    </div>
                    <div class="col one-half last">
                        <asp:label runat="server" CssClass="form-label" Text="Last Name" />
                        <asp:TextBox ID="LName" runat="server" Enabled="false" CssClass="disabled" />
                    </div>
                </div>
              <div class="row">
                    <div class="col one-half">
                        <asp:label runat="server" CssClass="form-label" Text="Gender" />
                        <asp:TextBox ID="Gender" runat="server" Enabled="false" CssClass="disabled" />
                    </div>
                    <div class="col one-half last">
                        <asp:label runat="server" CssClass="form-label" Text="Date of Birth" />
                        <asp:TextBox ID="DoB" runat="server" Enabled="false" CssClass="disabled"/>
                    </div>
                </div>
    </section>
    <section class="boxed-container my-account">
                <h4>You are free to update the following details.</h4>
            <fieldset id="pinfo-form" class="no-border no-padding">
            <asp:Label ID="lbl_msg" runat="server" Text="" />
                <div class="row">
                    <div class="col one-half">
                        <asp:label runat="server" CssClass="form-label" Text="Phone Number" />
                        <asp:TextBox ID="phone" runat="server" Text="" />
                        <asp:RegularExpressionValidator ID="reg_phone" ControlToValidate="phone" runat="server" ErrorMessage="Phone number must be in the following format: +968 0000 0000" ValidationExpression="^[1-9]{1}\d{7}" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_regphone" runat="server" TargetControlID="reg_phone" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                    </div>
                    <div class="col one-half last">
                        <asp:label runat="server" CssClass="form-label" Text="Address" />
                        <asp:TextBox ID="address" runat="server" Text="" />
                    </div>
                </div>
              <div class="row">
                    <div class="col one-half">
                        <asp:label runat="server" CssClass="form-label" Text="P.O. Box" />
                        <asp:TextBox ID="pobox" runat="server" Text="" />
                        <asp:RegularExpressionValidator ID="reg_pobox" ControlToValidate="pobox" runat="server" ErrorMessage="P.O. Box field must contain numbers only" ValidationExpression="^[0-9]*$" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_regpobox" runat="server" TargetControlID="reg_pobox" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                    </div>
                    <div class="col one-half last">
                        <asp:label runat="server" CssClass="form-label" Text="Postal Code" />
                        <asp:TextBox ID="pcode" runat="server" Text="" />
                        <asp:RegularExpressionValidator ID="reg_pcode" ControlToValidate="pcode" runat="server" ErrorMessage="Postal Code field must contain numbers only" ValidationExpression="^[0-9]*$" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_regpcode" runat="server" TargetControlID="reg_pcode" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="img/warning-icon.png" />
                    </div>
                </div>
            </fieldset>
    </section>
    <section class="boxed-container">
        <div class="row">
            <asp:Button ID="save" CssClass="plain-button" runat="server" Text="save" OnClick="updatepersonal" />
            <asp:Button ID="cancel" CssClass="plain-button cancel-button" runat="server" Text="Cancel" OnClick="btn_cancel_Click" CausesValidation="false" />
        </div>
    </section>
</asp:Content>
