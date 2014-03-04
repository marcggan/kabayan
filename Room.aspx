<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Room.aspx.cs" Inherits="Room" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .head
    {
        height:35px;
        left:0px;
        top:0px;
        width:100%;
        position:absolute;
        background-color:rgba(0,0,0,0.2);
    }
    .head h4
    {
        margin:10px;
    }
    .button
    {
        position:absolute;
        bottom:0;
        height:30px;
        left:0;
    }
    .rooms
    {
        width:100%;
    }
    .divimg{
      height:200px;
      padding:0px;
      margin:0px;
      border:1px solid black;
    }
    .filter{
      height:130px;
      padding:0px;
      margin:0px;
      border:1px solid black;
    }
    .show{
      width:100%;
      height:100%;
      position:absolute;
      background-color:#002c87;
      background-image:url("img/darkwood.jpg");
      padding:35px 5px 30px 5px;
      text-align:justify;
      font-weight:normal;
    }
    .image
    {
      top:0;
      left:0;
      height:100%;
      width:100%;
      position:absolute;
      text-align:center;
    }
    .backtop
    {
        height:100%;
    }
    .cap
    {
        width:100px;
    }
    .first
    {
        padding-top:10px;
    }

  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="rooms container">
        <div class="row">
            <div class='col-xs-12 filter'>
                <div class='show first'>
                    <div class="row">
                        <div class='col-xs-2 col-xs-offset-2'>
                            <asp:Label ID="lblCapacity" class="control-label" Text="Capacity: " runat="server"></asp:Label>
                            <asp:TextBox ID="txtCapacity" runat="server" class="form-control cap"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtCapacity" ValidationGroup="filter"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator2" runat="server" Type="Integer" 
                                MinimumValue="1" MaximumValue="40" ControlToValidate="txtCapacity" 
                                ErrorMessage="Please enter a valid number" ValidationGroup="filter" />
                        </div>
                        <div class='col-xs-3'>
                        <asp:Label ID="lblCheckIn" class="control-label" runat="server" Text="Check In"></asp:Label>
                           <!-- ReadOnly="true" -->
                        <asp:TextBox ID="txtCheckIn" runat="server" class="checkin datepicker form-control"></asp:TextBox>
                            <!--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtCheckIn" ValidationGroup="filter"></asp:RequiredFieldValidator>-->
                        </div>
                        <div class='col-xs-3'>
                        <asp:Label ID="lblCheckOut" class="control-label" runat="server" Text="Check Out"></asp:Label>
                              <!-- ReadOnly="true" -->
                        <asp:TextBox ID="txtCheckOut" runat="server" class="datepicker checkout form-control"></asp:TextBox>
                            <!--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtCheckOut" ValidationGroup="filter"></asp:RequiredFieldValidator>-->
                        </div>
                    </div>
                    <div class="row">
                        <div class='col-xs-3 col-xs-offset-3'>
                        <asp:Button ID="btnFilter" class="btn btn-default btn-block" 
                            Text="Filter" runat="server" CausesValidation="true" ValidationGroup="filter" 
                            onclick="btnFilter_Click"/>
                        </div>
                        <div class='col-xs-3'>
                        <asp:Button ID="btnClear" class="btn btn-default btn-block" 
                            Text="Clear filter" runat="server" onclick="btnClear_Click"/>
                        </div>
                    </div>
                </div>
            </div>
            <div id="divRooms" runat="server"></div>
            <div class='col-xs-3 divimg'>
                <div class='show'>
                    <h2><a href='#' class='btn btn-block backtop button' >Back to top</a></h2>
                </div>
            </div>
        </div>
        
    </div>
    
</asp:Content>

