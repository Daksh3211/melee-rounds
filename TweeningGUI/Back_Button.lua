local Btn = script.Parent
local Clicksound = game.Workspace.Sounds.Click
local frame = script.Parent.Parent
local Bg = script.Parent.Parent.Parent.Parent.MainMenu.Shop
local bg = script.Parent.Parent.Parent.Parent.MainMenu.SettingsFrame
local credit = script.Parent.Parent.Parent.Parent.MainMenu.CreditFrame
local shoptext = Bg.ShopText
local rareshop = script.Parent.Parent.Parent.Parent.MainMenu.RareShop
local legendshop = script.Parent.Parent.Parent.Parent.MainMenu.LegendShop
local clicktobuy = script.Parent.Parent.Parent.Parent.MainMenu.ClickToBuy
bg.Visible = false
Bg.Visible = false
credit.Visible = false
shoptext.Visible = false
clicktobuy.Visible = false
Btn.MouseButton1Click:Connect(function()
    Clicksound:Play()
        frame:TweenPosition(UDim2.new(0.19, 0,0.19, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint,2)
    Bg.Position = UDim2.new(0.336, 0, 1)
    bg.Position = UDim2.new(0.336, 0, 1)
    credit.Position = UDim2.new(0.336, 0, 1)
    Bg:TweenPosition(UDim2.new(0.336,0,1,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 2)
    bg:TweenPosition(UDim2.new(0.336,0,1,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 2)
    credit:TweenPosition(UDim2.new(0.336,0,1,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 2)
    --credit.Visible = true
    Bg.Visible = true
    bg.Visible = true
    --rareshop.Visible = true
    Btn.Visible = false
    wait(0.1)
    legendshop.Visible = false
    shoptext.Visible = false
    clicktobuy.Visible = false
    bg.Visible = false
    Bg.Visible = false
    credit.Visible = false
    rareshop.Visible = false
end)