<%@ Page Title="Manage Personal Information" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManagePersonalInfo.aspx.cs" Inherits="BooksLibrary.Web.Account.ManagePersonalInfo" %>

<asp:Content ID="PersonalInformation" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">
        <h4>Manage Personal Information</h4>
        <hr />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="firstName" CssClass="col-md-2 control-label">First Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="firstName" CssClass="form-control" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="lastName" CssClass="col-md-2 control-label">Last Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="lastName" CssClass="form-control" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" Text="Update" OnClick="UpdatePersonalInfo" CssClass="btn btn-default" />
            </div>
        </div>
    </div>

</asp:Content>
