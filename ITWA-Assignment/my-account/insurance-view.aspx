<%@ Page Title="" Language="C#" MasterPageFile="~/my-account/account.master" AutoEventWireup="true" CodeFile="insurance-view.aspx.cs" Inherits="my_account_insurance_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>View Insurance Policy - Oman United</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headend" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderPlaceHolder" Runat="Server">
    <section id="title-bar">
        <asp:SiteMapPath ID="Breadcrumb" CssClass="breadcrumb" runat="server" SkipLinkText="" SiteMapProvider="SiteMapPath">
            <RootNodeTemplate><a href="<%= SiteMap.RootNode.Url %>">Home</a></RootNodeTemplate>
            <CurrentNodeTemplate></CurrentNodeTemplate>
        </asp:SiteMapPath>
        <h2 id="page_title" runat="server">View Insurance Policy</h2>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="boxed-container">
        <table class="full-width single-view details">
            <tr>
                <th>Name</th>
                <td>
                    <asp:TextBox ID="name" runat="server" Enabled="false"/>
                </td>
                <th>Gender</th>
                <td>
                    <asp:TextBox ID="gender" runat="server" Enabled="false"/>
                </td>
            </tr>
            <tr>
                <th>Phone</th>
                <td>
                    <asp:TextBox ID="phone" runat="server" Enabled="false"/>
                </td>
                <th>Email</th>
                <td>
                    <asp:TextBox ID="email" runat="server" Enabled="false"/>
                </td>
            </tr>
            <tr>
                <th>Date of Birth</th>
                <td>
                    <asp:TextBox ID="dob" runat="server" Enabled="false"/>
                </td>
                <th>Address</th>
                <td>
                    <asp:TextBox ID="address" runat="server" Enabled="false"/>
                </td>
            </tr>
        </table>
    </section>
    <section class="boxed-container">
        <table class="full-width single-view">
            <tr>
                <th>Policy Type</th>
                <td colspan="3" class="no-padding">
                    <asp:TextBox ID="policy_type" runat="server" Enabled="false"/>
                </td>
            </tr>
            <tr>
                <th>Status</th>
                <td>
                    <asp:TextBox ID="status" runat="server" Enabled="false"/>
                </td>
                <th>Policy Value</th>
                <td>
                    <asp:TextBox ID="value" runat="server" Enabled="false"/>
                </td>
            </tr>
            <tr>
                <th>Start Date</th>
                <td>
                    <asp:TextBox ID="sdate" runat="server" Enabled="false"/>
                </td>
                <th>End Date</th>
                <td>
                    <asp:TextBox ID="edate" runat="server" Enabled="false"/>
                </td>
            </tr>
        </table>
    </section>
    <section class="boxed-container">
        <table class="full-width single-view">
            <tr>
                <th class="sngl-tbl-head">Previous Claims</th>
                <td>
                    <asp:TextBox ID="claims" runat="server" Enabled="false"/>
                </td>
                <th class="sngl-tbl-head">Previous Insurer</th>
                <td>
                    <asp:TextBox ID="insurer" runat="server" Enabled="false"/>
                </td>
            </tr>
            <tr>
                <th class="sngl-tbl-head" colspan="5">Additional Information</th>
            </tr>
            <tr>
                <td colspan="5">
                    <asp:TextBox ID="info" runat="server" TextMode="MultiLine" Enabled="false" Rows="10"/>
                </td>
            </tr>
        </table>
    </section>
</asp:Content>
