<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Insert.aspx.cs" Inherits="BooksLibrary.Web.Admin.Authors.Insert" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <fieldset class="form-horizontal">
        <legend>Add Author</legend>
        <div class="form-group">
            <label for="AuthorNameInput" class="col-lg-2 control-label">Name</label>
            <div class="col-lg-10">
                <asp:TextBox runat="server" ID="AuthorNameInput" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ErrorMessage="Author name is required." ControlToValidate="AuthorNameInput" runat="server" CssClass="text-danger" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="AuthorNameInput" CssClass="text-danger" ErrorMessage="Password must be between 1 and 200 characters." ValidationExpression="^.{1,200}$" />
            </div>
        </div>
        <div class="form-group">
            <label for="AuthorInfoInput" class="col-lg-2 control-label">Info</label>
            <div class="col-lg-10">
                <asp:TextBox TextMode="MultiLine" runat="server" ID="AuthorInfoInput" class="form-control"></asp:TextBox>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="AuthorInfoInput" CssClass="text-danger" ErrorMessage="Password must be between 1 and 200 characters." ValidationExpression="^.{5,500}$" />
            </div>
        </div>
        <div class="form-group">
            <label for="AuthorImageInput" class="col-lg-2 control-label">Image</label>
            <div class="col-lg-10">
                <asp:FileUpload runat="server" ID="AuthorImageInput" class="form-control"></asp:FileUpload>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-10 col-lg-offset-2">
                <asp:Button runat="server" ID="CreateAuthor" class="btn btn-primary" OnClick="CreateAuthor_Click" Text="Add"></asp:Button>
                <asp:Button runat="server" ID="CancelButton" class="btn btn-default" OnClick="CancelButton_Click" Text="Cancel" CausesValidation="false"></asp:Button>
            </div>
        </div>
    </fieldset>
</asp:Content>
