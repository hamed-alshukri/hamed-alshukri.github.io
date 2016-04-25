<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="support-ticket-submit.aspx.cs" Inherits="support_ticket_submit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headbegin" Runat="Server">
    <title>Support Ticket Submitted - Oman United</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headend" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeaderPlaceHolder" Runat="Server">
    <section id="title-bar">
        <asp:SiteMapPath ID="Breadcrumb" CssClass="breadcrumb" runat="server" SkipLinkText="" SiteMapProvider="SiteMapPath">
            <RootNodeTemplate><a href="<%= SiteMap.RootNode.Url %>">Home</a></RootNodeTemplate>
            <CurrentNodeTemplate></CurrentNodeTemplate>
        </asp:SiteMapPath>
        <h2>Support Ticket Submitted</h2>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="boxed-container">
        <h2 class="text-center msg-success"><i class="fa fa-check-circle"></i> Your support ticket has been submitted successfully!</h2>
        <h3 class="text-center">For your reference, below are the details you had entered.</h3>
        <div class="inside-box">
            <p>
                <label>Name:</label>
                <asp:TextBox ID="name" runat="server" ReadOnly="true" />
            </p>
            
            <p>
            <label>Phone Number:</label>
            <asp:TextBox ID="phone" runat="server" ReadOnly="true" />
            </p>

            <p>
                <label>Email:</label>
                <asp:TextBox ID="email" runat="server" ReadOnly="true" />
            </p>
            
            <p>
                <label>Subject:</label>
                <asp:TextBox ID="subject" runat="server" ReadOnly="true" />
            </p>

            <p>
                <label>Department:</label>
                <asp:TextBox ID="dept" runat="server" ReadOnly="true" />
            </p>

            <p>
                <label>Message:</label>
                <asp:TextBox ID="message" runat="server" ReadOnly="true" TextMode="MultiLine" />
            </p>
        </div>
    </section>
</asp:Content>
