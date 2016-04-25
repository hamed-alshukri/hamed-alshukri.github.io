<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="support-ticket-view.aspx.cs" Inherits="support_ticket_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>View Support Ticket - Oman United</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headend" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderPlaceHolder" Runat="Server">
    <section id="title-bar">
        <asp:SiteMapPath ID="Breadcrumb" CssClass="breadcrumb" runat="server" SkipLinkText="" SiteMapProvider="SiteMapPath">
            <RootNodeTemplate><a href="<%= SiteMap.RootNode.Url %>">Home</a></RootNodeTemplate>
            <CurrentNodeTemplate></CurrentNodeTemplate>
        </asp:SiteMapPath>
        <h2 id="page_title" runat="server">View Support Ticket</h2>
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
                <th>Status</th>
                <td>
                    <asp:TextBox ID="status" runat="server" Enabled="false"/>
                </td>
            </tr>
            <tr>
                <th>Phone</th>
                <td>
                    <asp:TextBox ID="phone" runat="server" Enabled="false"/>
                </td>
                <th>Submission Date</th>
                <td>
                    <asp:TextBox ID="sdate" runat="server" Enabled="false"/>
                </td>
            </tr>
            <tr>
                <th>Email</th>
                <td>
                    <asp:TextBox ID="email" runat="server" Enabled="false"/>
                </td>
                <th>Department</th>
                <td>
                    <asp:TextBox ID="dept" runat="server" Enabled="false"/>
                </td>
            </tr>
        </table>
    </section>
    <section class="boxed-container">
        <table class="full-width single-view subject">
            <tr>
                <th>Subject</th>
                <td>
                    <asp:TextBox ID="subject" runat="server" Enabled="false"/>
                </td>
            </tr>
        </table>
    </section>
    <section class="boxed-container">
        <table class="full-width single-view message">
            <tr>
                <th class="sngl-tbl-head">Message</th>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="message" runat="server" TextMode="MultiLine" Enabled="false" Rows="10"/>
                </td>
            </tr>
        </table>
    </section>
</asp:Content>
