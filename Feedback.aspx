<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="content2">
<div class="form-horizontal">
<div class="form-group">
    <div class="container-fluid">
        <div class="row">
            <h3>Feedback</h3>
        </div>
        <div class="row">
            <div class="col-xs-2 col-xs-offset-2">
                <asp:Label class="control-label" ID="lblSubject" runat="server" Text="Subject:"></asp:Label>
            </div>
            <div class="col-xs-3">
                <asp:Textbox class="form-control" ID="txtSubject" runat="server"></asp:TextBox>
            </div>
            <div class="col-xs-2">
                <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ErrorMessage="*" ControlToValidate="txtSubject"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-2 col-xs-offset-2">
                <asp:Label class="control-label" ID="lblMessage" runat="server" Text="Message:"></asp:Label>
            </div>
            <div class="col-xs-6">
                <asp:Textbox class="form-control" ID="txtMessage" runat="server" Rows="5" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div class="col-xs-2">
                <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ErrorMessage="*" ControlToValidate="txtMessage"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row">
            <asp:Button class="btn btn-primary" ID="btnSend" runat="server" Text="Send"
                            onclick="btnSend_Click" />
        </div>

    </div>
</div>
</div>
</div>
</asp:Content>

