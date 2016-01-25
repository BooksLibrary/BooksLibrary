<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="BooksLibrary.Web.Books.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView runat="server" ID="BookDetailsView1" ItemType="BooksLibrary.Models.Book"
        DataKeyNames="Id"
        SelectMethod="BookDetailsView_GetItem">
        <ItemTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2><%#:Item.Title %></h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <img src="http://www.text2image.com/user_images/text2image_T84439_20160123_153545.jpg" alt="Alternate Text" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <p><%#:Item.Description %></p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div><strong>Author:</strong><%#:Item.Author.Name %></div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div><%#:Item.Author.Info %></div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <asp:Button ID="btnAdd" runat="Server" Text="Add to MyLib" class="btn btn-primary" />
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
