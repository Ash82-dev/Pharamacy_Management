<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Back_end._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="app-container">
        <h1 class="primary-header">Pharamacy Management System</h1>
        <div class="input-fields">
            <div class="input-field">
                <label for="med-name">Medicine Name</label>
                <input type="text" id="medName" placeholder="Medicine Name" runat="server" />
            </div>
            <div class="input-field">
                <label for="category">Category</label>
                <asp:DropDownList ID="category" runat="server">
                    <asp:ListItem Text="Sirop" Value="sirop"></asp:ListItem>
                    <asp:ListItem Text="Tablets" Value="tablets"></asp:ListItem>
                    <asp:ListItem Text="Injection " Value="injection "></asp:ListItem>
                    <asp:ListItem Text="Perfusion" Value="perfusion"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="input-field">
                <label for="quantity">Quantity</label>
                <input type="text" id="quantity" placeholder="Quantity" runat="server" />
            </div>
            <div class="input-field">
                <label for="price">Price</label>
                <input type="text" id="price" placeholder="Price" runat="server" />
            </div>
            <div class="input-field">
                <label for="manufacturer">Manufacturer</label>
                <asp:DropDownList ID="manufacturer" runat="server">
                    <asp:ListItem Text="Pfizer" Value="pfizer"></asp:ListItem>
                    <asp:ListItem Text="AstraZeneca" Value="astrazeneca"></asp:ListItem>
                    <asp:ListItem Text="Sinopharm " Value="sinopharm "></asp:ListItem>
                    <asp:ListItem Text="Moderna" Value="moderna"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="buttons">
            <asp:Button CssClass="button" ID="AddBtn" runat="server" Text="ADD" OnClick="AddBtn_Click" />
            <asp:Button CssClass="button" ID="EditBtn" runat="server" Text="EDIT" OnClick="EditBtn_Click" />
            <asp:Button CssClass="button" ID="DeleteBtn" runat="server" Text="DELETE" OnClick="DeleteBtn_Click" />
        </div>
        

        <div class="grid-container">
            <asp:GridView ID="gridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"
                OnSelectedIndexChanged="GridView_SelectedIndexChanged"
                Width="1200px" CellPadding="4" ForeColor="#333333" GridLines="None">
                <Columns>
                    <asp:TemplateField HeaderText="Select">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect" runat="server" AutoPostBack="true" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" />
                    <asp:BoundField DataField="name" HeaderText="name" />
                    <asp:BoundField DataField="category" HeaderText="category" />
                    <asp:BoundField DataField="quantity" HeaderText="quantity" />
                    <asp:BoundField DataField="price" HeaderText="price" />
                    <asp:BoundField DataField="manufacturer" HeaderText="manufacturer" />
                </Columns>
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#167d7f" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#167d7f" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
