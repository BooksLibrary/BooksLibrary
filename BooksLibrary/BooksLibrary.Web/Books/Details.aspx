<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="BooksLibrary.Web.Books.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView runat="server" ID="BookDetailsView1" ItemType="BooksLibrary.Models.Book"
        DataKeyNames="Id"
        SelectMethod="BookDetailsView_GetItem">
        <ItemTemplate>
            <h1><%#: Item.Title %></h1>
            <asp:Image ImageUrl="http://www.text2image.com/user_images/text2image_T84439_20160123_153545.jpg" runat="server" ID="AuthorImageContainer"></asp:Image>
            <p><%#: Item.Description %></p>
            <asp:Button ID="btnAdd" runat="Server" Text="Add to MyLib" class="btn btn-primary" />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
