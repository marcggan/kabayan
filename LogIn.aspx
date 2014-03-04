<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Inherits="LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
    <div class="form-signin">
        <h3 class="form-signin-heading">Please log in</h3>
        <div class="row">
            <div class="col-xs-4 col-xs-offset-4">
                <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Email" required="" autofocus=""></asp:TextBox>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-xs-4 col-xs-offset-4">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control" placeholder="Password" required="" ></asp:TextBox>
            </div>
        </div>
        <br />
        <asp:Button ID="btnLogIn" runat="server" Text="Log In" 
            onclick="btnLogIn_Click" class="btn btn-lg btn-primary"/>
        <br />
        <asp:Label ID="lblCheck" runat="server" />
    </div>
</div>
</asp:Content>

