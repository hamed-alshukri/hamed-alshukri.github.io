<%@ Page Title="" Language="C#" MasterPageFile="~/my-account/account.master" AutoEventWireup="true" CodeFile="insurance-add.aspx.cs" Inherits="my_account_insurance_add" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>Add Insurance Policy- Oman United</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headend" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderPlaceHolder" Runat="Server">
    <section id="title-bar">
        <asp:SiteMapPath ID="Breadcrumb" CssClass="breadcrumb" runat="server" SkipLinkText="" SiteMapProvider="SiteMapPath">
            <RootNodeTemplate><a href="<%= SiteMap.RootNode.Url %>">Home</a></RootNodeTemplate>
            <CurrentNodeTemplate></CurrentNodeTemplate>
        </asp:SiteMapPath>
        <h2>Add Insurance Policy</h2>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="script" runat="server" />
    <section class="boxed-container">
        <asp:Label ID="lbl_msg" runat="server" Text="" ForeColor="Red"/>
            <fieldset id="contact-form" class="no-border no-padding">
                <div class="row">
                    <asp:label ID="PolicyTypeLabel" runat="server" CssClass="form-label" Text="Policy Type" />
                    <asp:DropDownList ID="PolicyType" runat="server" CssClass="select-menu">
                        <asp:ListItem Text="-- Select Policy Type --" Value="0" /> 
                        <asp:ListItem Text="Building" Value="Building" />
                        <asp:ListItem Text="Health" Value="Health" />
                        <asp:ListItem Text="Travel" Value="Travel" />
                        <asp:ListItem Text="Vehicle" Value="Vehicle" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="req_PolicyType" ControlToValidate="PolicyType" runat="server" ErrorMessage="Please select policy type" Display="None" SetFocusOnError="true" InitialValue="0" />
                    <asp:ValidatorCalloutExtender ID="cout_reqPolicyType" runat="server" TargetControlID="req_PolicyType" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="../img/warning-icon.png" Width="250" />
                </div>
                <div class="row">
                    <div class="col one-half">
                        <asp:label ID="StartDateLabel" runat="server" CssClass="form-label" Text="Start Date" />
                        <asp:TextBox ID="StartDate" runat="server" TextMode="Date" />
                        <asp:RequiredFieldValidator ID="req_StartDate" ControlToValidate="StartDate" runat="server" ErrorMessage="Please enter policy start date" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_reqStartDate" runat="server" TargetControlID="req_StartDate" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="../img/warning-icon.png" />
                    </div>
                    <div class="col one-half last">
                        <asp:label ID="EndDateLabel" runat="server" CssClass="form-label" Text="End Date" />
                        <asp:TextBox ID="EndDate" runat="server" TextMode="Date" />
                        <asp:RequiredFieldValidator ID="req_EndDate" ControlToValidate="EndDate" runat="server" ErrorMessage="Please enter policy end date" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_reqEndDate" runat="server" TargetControlID="req_EndDate" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="../img/warning-icon.png" />
                    </div>
                </div>
                <div class="row">
                    <div class="col one-half">
                        <asp:label ID="PrevClaimLabel" runat="server" CssClass="form-label" Text="Previous Claims" />
                        <asp:TextBox ID="PrevClaim" runat="server" />
                        <asp:RegularExpressionValidator ID="reg_PrevClaim" ControlToValidate="PrevClaim" runat="server" ErrorMessage="This field must contain alphabets only and should not be more than 50 charaters" ValidationExpression="^([a-zA-Z0-1.\s]{1,50})$" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_regPrevClaim" runat="server" TargetControlID="reg_PrevClaim" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="../img/warning-icon.png" />
                    </div>
                    <div class="col one-half last">
                        <asp:label ID="PrevInsurerLabel" runat="server" CssClass="form-label" Text="Previous Insurer" />
                        <asp:TextBox ID="PrevInsurer" runat="server" />
                        <asp:RegularExpressionValidator ID="reg_PrevInsurer" ControlToValidate="PrevInsurer" runat="server" ErrorMessage="This field should not be more than 50 alphanumeric charaters" ValidationExpression="^([a-zA-Z0-1@.\s]{1,50})$" Display="None" SetFocusOnError="true" />
                        <asp:ValidatorCalloutExtender ID="cout_regPrevInsurer" runat="server" TargetControlID="reg_PrevInsurer" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="../img/warning-icon.png" />
                    </div>
                </div>
                <div class="row">
                    <asp:label ID="AddInfoLabel" runat="server" CssClass="form-label" Text="Additional Information" />
                    <asp:TextBox ID="AddInfo" runat="server" TextMode="MultiLine" Height="350" />
                    <asp:RegularExpressionValidator ID="reg_AddInfo" ControlToValidate="AddInfo" runat="server" ErrorMessage="Additional Information should not be more than 250 characters" ValidationExpression="^([a-zA-Z0-1@.\s]{1,250})$" Display="None" SetFocusOnError="true" />
                    <asp:ValidatorCalloutExtender ID="cout_regAddInfo" runat="server" TargetControlID="reg_AddInfo" Enabled="true" HighlightCssClass="error-highlight" CssClass="error-popup" PopupPosition="BottomLeft" WarningIconImageUrl="../img/warning-icon.png" />
                </div>
                <div class="row">
                    <asp:Button ID="submit" CssClass="plain-button" runat="server" Text="Submit Insurance Policy" OnClick="btn_tckt_Click" />
                </div>
            </fieldset>
    </section>
</asp:Content>
