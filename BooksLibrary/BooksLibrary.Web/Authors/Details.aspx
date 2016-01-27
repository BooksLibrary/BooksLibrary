<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Details.aspx.cs" Inherits="BooksLibrary.Web.Authors.Details" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:DetailsView runat="server" ID="AuthorDetailsViewPublic" ItemType="BooksLibrary.Models.Author"
        DataKeyNames="Id"
        AutoGenerateRows="False"
        SelectMethod="AuthorDetailsView_GetItem"
        UpdateMethod="AuthorDetailsView_UpdateItem"
        DeleteMethod="AuthorDetailsView_DeleteItem"
        BorderStyle="None">
        <Fields>
            <asp:TemplateField>
                <ItemTemplate>
                    <div class="jumbotron">
                        <h1><%#: Item.Name %></h1>
                        <asp:Image ImageUrl="<%# this.GetImageUrl() %>" runat="server" ID="AuthorImageContainer"></asp:Image>
                        <p><%#: Item.Info %></p>
                        <asp:Button runat="Server" Text="Edit" CommandName="Edit" class="btn btn-primary" />
                        <asp:Button runat="Server" Text="Delete" CommandName="Delete" class="btn btn-danger " />
                        <asp:LinkButton runat="Server" Text="Cancel" PostBackUrl="~/Authors/All.aspx" class="btn btn-default" />
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
</asp:Content>
