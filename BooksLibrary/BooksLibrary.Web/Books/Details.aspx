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
                        <asp:Button ID="btnAdd" OnClick="AddBookToMyLib" runat="Server" Text="Add to MyLib" class="btn btn-primary" />
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>

    <hr />
    <div id="commentsContainer" class="row" runat="server">
        <h3>Comments:</h3>
        <div id="addCommentContainer" runat="server" class="row">
            <h3>Add Comment:</h3>
            <div class="col-lg-2">
                <asp:TextBox ID="tbComment" runat="server" />
            </div>
            <div class="col-lg-2">
                <asp:Button CssClass="btn btn-primary" ID="btnAddComment" OnClick="AddComment" Text="Add" runat="server" />
            </div>
        </div>
        <asp:UpdatePanel ID="UpdatePanelComments" runat="server" class="panel" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Repeater ID="RepeaterComments" runat="server" ItemType="BooksLibrary.Models.Comment">
                    <ItemTemplate>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <strong><%#: Item.User.UserName %></strong> <span class="text-muted">commented on: <%#: Item.Date %></span>
                            </div>
                            <div class="panel-body">
                                <%#: Item.Content %>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <input type="hidden" id="currentPage" value="0" runat="server" />
                <asp:Button Text="Prev" CssClass="btn btn-default" ID="btnPrev" OnClick="Prev" runat="server" />
                <asp:Button Text="Next" CssClass="btn btn-default" ID="btnNext" OnClick="Next" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
