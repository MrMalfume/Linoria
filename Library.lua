local a=(cloneref or clonereference or function(a:any)
return a
end)
local b:CoreGui=a(game:GetService"CoreGui")
local c:Players=a(game:GetService"Players")
local d:RunService=a(game:GetService"RunService")
local e:SoundService=a(game:GetService"SoundService")
local f:UserInputService=a(game:GetService"UserInputService")
local g:TextService=a(game:GetService"TextService")
local h:Teams=a(game:GetService"Teams")
local i:TweenService=a(game:GetService"TweenService")

local j=getgenv or function()
return shared
end
local k=setclipboard or nil
local l=protectgui or(syn and syn.protect_gui)or function()end
local m=gethui or function()
return b
end

local n=c.LocalPlayer or c.PlayerAdded:Wait()
local o=n:GetMouse()

local p={}
local q={}
local r={}
local s={}

local t={
LocalPlayer=n,
DevicePlatform=nil,
IsMobile=false,
IsRobloxFocused=true,

ScreenGui=nil,

SearchText="",
Searching=false,
LastSearchTab=nil,

ActiveTab=nil,
Tabs={},
DependencyBoxes={},

KeybindFrame=nil,
KeybindContainer=nil,
KeybindToggles={},

Notifications={},

ToggleKeybind=Enum.KeyCode.RightControl,
TweenInfo=TweenInfo.new(0.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
NotifyTweenInfo=TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),

Toggled=false,
Unloaded=false,

Labels=p,
Buttons=q,
Toggles=r,
Options=s,

NotifySide="Right",
ShowCustomCursor=true,
ForceCheckbox=false,
ShowToggleFrameInKeybinds=true,
NotifyOnError=false,

CantDragForced=false,

Signals={},
UnloadSignals={},

MinSize=Vector2.new(480,360),
DPIScale=1,
CornerRadius=8,

IsLightTheme=false,
Scheme={
BackgroundColor=Color3.fromRGB(15,15,15),
MainColor=Color3.fromRGB(25,25,25),
AccentColor=Color3.fromRGB(125,85,255),
OutlineColor=Color3.fromRGB(40,40,40),
FontColor=Color3.new(1,1,1),
Font=Font.fromEnum(Enum.Font.Code),

Red=Color3.fromRGB(255,50,50),
Dark=Color3.new(0,0,0),
White=Color3.new(1,1,1),
},

Registry={},
DPIRegistry={},
}

local u={
Assets={
TransparencyTexture={
RobloxId=139785960036434,
Path="Obsidian/assets/TransparencyTexture.png",

Id=nil
},

SaturationMap={
RobloxId=4155801252,
Path="Obsidian/assets/SaturationMap.png",

Id=nil
}
}
}
do
local v="https://raw.githubusercontent.com/deividcomsono/Obsidian/refs/heads/main/"

local function RecursiveCreatePath(w:string,x:boolean?)
if not isfolder or not makefolder then return end

local y=w:split"/"
local z=""

if x then
table.remove(y,#y)
end

for A,B in ipairs(y)do
if not isfolder(z..B)then
makefolder(z..B)
end

z=z..B.."/"
end

return z
end

function u.GetAsset(w:string)
if not u.Assets[w]then
return nil
end

local x=u.Assets[w]
if x.Id then
return x.Id
end

local y=`rbxassetid://{x.RobloxId}`

if getcustomasset then
local z,A=pcall(getcustomasset,x.Path)

if z and A then
y=A
end
end

x.Id=y
return y
end

function u.DownloadAsset(w:string)
if not getcustomasset or not writefile or not isfile then
return
end

RecursiveCreatePath(w,true)

if isfile(w)then
return
end

local x=w:gsub("Obsidian/","")
writefile(w,game:HttpGet(`{v}{x}`))
end

for w,x in u.Assets do
u.DownloadAsset(x.Path)
end
end

if d:IsStudio()then
if f.TouchEnabled and not f.MouseEnabled then
t.IsMobile=true
t.MinSize=Vector2.new(480,240)
else
t.IsMobile=false
t.MinSize=Vector2.new(480,360)
end
else
pcall(function()
t.DevicePlatform=f:GetPlatform()
end)
t.IsMobile=(t.DevicePlatform==Enum.Platform.Android or t.DevicePlatform==Enum.Platform.IOS)
t.MinSize=t.IsMobile and Vector2.new(480,240)or Vector2.new(480,360)
end

local v={

Frame={
BorderSizePixel=0,
},
ImageLabel={
BackgroundTransparency=1,
BorderSizePixel=0,
},
ImageButton={
AutoButtonColor=false,
BorderSizePixel=0,
},
ScrollingFrame={
BorderSizePixel=0,
},
TextLabel={
BorderSizePixel=0,
FontFace="Font",
RichText=true,
},
TextButton={
AutoButtonColor=false,
BorderSizePixel=0,
FontFace="Font",
RichText=true,
},
TextBox={
BorderSizePixel=0,
FontFace="Font",
PlaceholderColor3=function()
local v,w,x=t.Scheme.FontColor:ToHSV()
return Color3.fromHSV(v,w,x/2)
end,
Text="",
},
UIListLayout={
SortOrder=Enum.SortOrder.LayoutOrder,
},
UIStroke={
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
},


Window={
Title="No Title",
Footer="No Footer",
Position=UDim2.fromOffset(6,6),
Size=UDim2.fromOffset(720,600),
IconSize=UDim2.fromOffset(30,30),
AutoShow=true,
Center=true,
Resizable=true,
CornerRadius=8,
NotifySide="Right",
ShowCustomCursor=true,
Font=Enum.Font.Code,
ToggleKeybind=Enum.KeyCode.RightControl,
MobileButtonsSide="Left",
Loader=false,
LoaderIcon=nil,
LoaderDuration=4.5,
},
Toggle={
Text="Toggle",
Default=false,

Callback=function()end,
Changed=function()end,

Risky=false,
Disabled=false,
Visible=true,
},
Input={
Text="Input",
Default="",
Finished=false,
Numeric=false,
ClearTextOnFocus=true,
Placeholder="",
AllowEmpty=true,
EmptyReset="---",

Callback=function()end,
Changed=function()end,

Disabled=false,
Visible=true,
},
Slider={
Text="Slider",
Default=0,
Min=0,
Max=100,
Rounding=0,

Prefix="",
Suffix="",

Callback=function()end,
Changed=function()end,

Disabled=false,
Visible=true,
},
Dropdown={
Values={},
DisabledValues={},
Multi=false,
MaxVisibleDropdownItems=8,

Callback=function()end,
Changed=function()end,

Disabled=false,
Visible=true,
},
Viewport={
Object=nil,
Camera=nil,
Clone=true,
AutoFocus=true,
Interactive=false,
Height=200,
Visible=true,
},
Preview={
Text="Preview",
Object=nil,
Camera=nil,
Clone=true,
Height=200,
SizeMode="fixed",
MinHeight=150,
MaxHeight=400,
AspectRatio=1.33,
ScaleFactor=0.3,
CameraDistance=10,
CameraAngle=Vector3.new(0,0,0),
BackgroundColor=nil,
AutoRotate=true,
RotationSpeed=1,
FocusIndicator=true,
Interactive=true,
AutoFocus=true,
Visible=true,

Callback=function()end,
},
Image={
Image="",
Transparency=0,
Color=Color3.new(1,1,1),
RectOffset=Vector2.zero,
RectSize=Vector2.zero,
ScaleType=Enum.ScaleType.Fit,
Height=200,
Visible=true,
},


KeyPicker={
Text="KeyPicker",
Default="None",
Mode="Toggle",
Modes={"Always","Toggle","Hold"},
SyncToggleState=false,

Callback=function()end,
ChangedCallback=function()end,
Changed=function()end,
Clicked=function()end,
},
ColorPicker={
Default=Color3.new(1,1,1),

Callback=function()end,
Changed=function()end,
},
}

local w={
Bottom={0,1},
Right={1,0},
}
local x={
Left={0.5,1},
Right={0.5,1},
}


local function ApplyDPIScale(y,z)
if typeof(y)=="UDim"then
return UDim.new(y.Scale,y.Offset*t.DPIScale)
end

if z then
return UDim2.new(
y.X.Scale,
(y.X.Offset*t.DPIScale)+(z[1]*t.DPIScale),
y.Y.Scale,
(y.Y.Offset*t.DPIScale)+(z[2]*t.DPIScale)
)
end

return UDim2.new(
y.X.Scale,
y.X.Offset*t.DPIScale,
y.Y.Scale,
y.Y.Offset*t.DPIScale
)
end
local function ApplyTextScale(y)
return y*t.DPIScale
end

local function WaitForEvent(y,z,A)
local B=Instance.new"BindableEvent"
local C=y:Once(function(...)
if not A or typeof(A)=="function"and A(...)then
B:Fire(true)
else
B:Fire(false)
end
end)
task.delay(z,function()
C:Disconnect()
B:Fire(false)
end)

local D=B.Event:Wait()
B:Destroy()

return D
end

local function IsMouseInput(y:InputObject,z:boolean?)
return y.UserInputType==Enum.UserInputType.MouseButton1
or z and y.UserInputType==Enum.UserInputType.MouseButton2
or y.UserInputType==Enum.UserInputType.Touch
end
local function IsClickInput(y:InputObject,z:boolean?)
return IsMouseInput(y,z)
and y.UserInputState==Enum.UserInputState.Begin
and t.IsRobloxFocused
end
local function IsHoverInput(y:InputObject)
return(y.UserInputType==Enum.UserInputType.MouseMovement or y.UserInputType==Enum.UserInputType.Touch)
and y.UserInputState==Enum.UserInputState.Change
end

local function GetTableSize(y:{[any]:any})
local z=0

for A,B in pairs(y)do
z+=1
end

return z
end
local function StopTween(y:TweenBase)
if not(y and y.PlaybackState==Enum.PlaybackState.Playing)then
return
end

y:Cancel()
end
local function Trim(y:string)
return y:match"^%s*(.-)%s*$"
end
local function Round(y,z)
assert(z>=0,"Invalid rounding number.")

if z==0 then
return math.floor(y)
end

return tonumber(string.format("%."..z.."f",y))
end

local function GetPlayers(y:boolean?)
local z=c:GetPlayers()

if y then
local B=table.find(z,n)
if B then
table.remove(z,B)
end
end

table.sort(z,function(B,C)
return B.Name:lower()<C.Name:lower()
end)

return z
end
local function GetTeams()
local y=h:GetTeams()

table.sort(y,function(z,B)
return z.Name:lower()<B.Name:lower()
end)

return y
end

function t.UpdateKeybindFrame(y)
if not t.KeybindFrame then
return
end

local z=0
for B,C in pairs(t.KeybindToggles)do
if not C.Holder.Visible then
continue
end

local D=C.Label.Size.X.Offset+C.Label.Position.X.Offset
if D>z then
z=D
end
end

t.KeybindFrame.Size=UDim2.fromOffset(z+18*t.DPIScale,0)
end
function t.UpdateDependencyBoxes(y)
for z,B in pairs(t.DependencyBoxes)do
B:Update(true)
end

if t.Searching then
t:UpdateSearch(t.SearchText)
end
end

local function CheckDepbox(y,z)
local B=0

for C,D in pairs(y.Elements)do
if D.Type=="Divider"then
D.Holder.Visible=false
continue
elseif D.SubButton then

local E=false


if D.Text:lower():match(z)and D.Visible then
E=true
else
D.Base.Visible=false
end
if D.SubButton.Text:lower():match(z)and D.SubButton.Visible then
E=true
else
D.SubButton.Base.Visible=false
end
D.Holder.Visible=E
if E then
B+=1
end

continue
end


if D.Text and D.Text:lower():match(z)and D.Visible then
D.Holder.Visible=true
B+=1
else
D.Holder.Visible=false
end
end

for C,D in pairs(y.DependencyBoxes)do
if not D.Visible then
continue
end

B+=CheckDepbox(D,z)
end

return B
end
local function RestoreDepbox(y)
for z,B in pairs(y.Elements)do
B.Holder.Visible=typeof(B.Visible)=="boolean"and B.Visible or true

if B.SubButton then
B.Base.Visible=B.Visible
B.SubButton.Base.Visible=B.SubButton.Visible
end
end

y:Resize()
y.Holder.Visible=true

for z,B in pairs(y.DependencyBoxes)do
if not B.Visible then
continue
end

RestoreDepbox(B)
end
end

function t.UpdateSearch(y,z)
t.SearchText=z


if t.LastSearchTab then
for B,C in pairs(t.LastSearchTab.Groupboxes)do
for D,E in pairs(C.Elements)do
E.Holder.Visible=typeof(E.Visible)=="boolean"and E.Visible or true

if E.SubButton then
E.Base.Visible=E.Visible
E.SubButton.Base.Visible=E.SubButton.Visible
end
end

for D,E in pairs(C.DependencyBoxes)do
if not E.Visible then
continue
end

RestoreDepbox(E)
end

C:Resize()
C.Holder.Visible=true
end

for B,C in pairs(t.LastSearchTab.Tabboxes)do
for D,E in pairs(C.Tabs)do
for F,G in pairs(E.Elements)do
G.Holder.Visible=typeof(G.Visible)=="boolean"and G.Visible
or true

if G.SubButton then
G.Base.Visible=G.Visible
G.SubButton.Base.Visible=G.SubButton.Visible
end
end

for F,G in pairs(E.DependencyBoxes)do
if not G.Visible then
continue
end

RestoreDepbox(G)
end

E.ButtonHolder.Visible=true
end

C.ActiveTab:Resize()
C.Holder.Visible=true
end

for B,C in pairs(t.LastSearchTab.DependencyGroupboxes)do
if not C.Visible then
continue
end

for D,E in pairs(C.Elements)do
E.Holder.Visible=typeof(E.Visible)=="boolean"and E.Visible or true

if E.SubButton then
E.Base.Visible=E.Visible
E.SubButton.Base.Visible=E.SubButton.Visible
end
end

for D,E in pairs(C.DependencyBoxes)do
if not E.Visible then
continue
end

RestoreDepbox(E)
end

C:Resize()
C.Holder.Visible=true
end
end


local B=z:lower()
if Trim(B)==""or t.ActiveTab.IsKeyTab then
t.Searching=false
t.LastSearchTab=nil
return
end

t.Searching=true


for C,D in pairs(t.ActiveTab.Groupboxes)do
local E=0

for F,G in pairs(D.Elements)do
if G.Type=="Divider"then
G.Holder.Visible=false
continue
elseif G.SubButton then

local H=false


if G.Text:lower():match(B)and G.Visible then
H=true
else
G.Base.Visible=false
end
if G.SubButton.Text:lower():match(B)and G.SubButton.Visible then
H=true
else
G.SubButton.Base.Visible=false
end
G.Holder.Visible=H
if H then
E+=1
end

continue
end


if G.Text and G.Text:lower():match(B)and G.Visible then
G.Holder.Visible=true
E+=1
else
G.Holder.Visible=false
end
end

for F,G in pairs(D.DependencyBoxes)do
if not G.Visible then
continue
end

E+=CheckDepbox(G,B)
end


if E>0 then
D:Resize()
end
D.Holder.Visible=E>0
end

for C,D in pairs(t.ActiveTab.Tabboxes)do
local E=0
local F={}

for G,H in pairs(D.Tabs)do
F[H]=0

for I,J in pairs(H.Elements)do
if J.Type=="Divider"then
J.Holder.Visible=false
continue
elseif J.SubButton then

local K=false


if J.Text:lower():match(B)and J.Visible then
K=true
else
J.Base.Visible=false
end
if J.SubButton.Text:lower():match(B)and J.SubButton.Visible then
K=true
else
J.SubButton.Base.Visible=false
end
J.Holder.Visible=K
if K then
F[H]+=1
end

continue
end


if J.Text and J.Text:lower():match(B)and J.Visible then
J.Holder.Visible=true
F[H]+=1
else
J.Holder.Visible=false
end
end

for I,J in pairs(H.DependencyBoxes)do
if not J.Visible then
continue
end

F[H]+=CheckDepbox(J,B)
end
end

for G,H in pairs(F)do
G.ButtonHolder.Visible=H>0
if H>0 then
E+=1

if D.ActiveTab==G then
G:Resize()
elseif F[D.ActiveTab]==0 then
G:Show()
end
end
end


D.Holder.Visible=E>0
end

for C,D in pairs(t.ActiveTab.DependencyGroupboxes)do
if not D.Visible then
continue
end

local E=0

for F,G in pairs(D.Elements)do
if G.Type=="Divider"then
G.Holder.Visible=false
continue
elseif G.SubButton then

local H=false


if G.Text:lower():match(B)and G.Visible then
H=true
else
G.Base.Visible=false
end
if G.SubButton.Text:lower():match(B)and G.SubButton.Visible then
H=true
else
G.SubButton.Base.Visible=false
end
G.Holder.Visible=H
if H then
E+=1
end

continue
end


if G.Text and G.Text:lower():match(B)and G.Visible then
G.Holder.Visible=true
E+=1
else
G.Holder.Visible=false
end
end

for F,G in pairs(D.DependencyBoxes)do
if not G.Visible then
continue
end

E+=CheckDepbox(G,B)
end


if E>0 then
D:Resize()
end
D.Holder.Visible=E>0
end


t.LastSearchTab=t.ActiveTab
end

function t.AddToRegistry(y,z,B)
t.Registry[z]=B
end

function t.RemoveFromRegistry(y,z)
t.Registry[z]=nil
end

function t.UpdateColorsUsingRegistry(y)
for z,B in pairs(t.Registry)do
for C,D in pairs(B)do
if typeof(D)=="string"then
z[C]=t.Scheme[D]
elseif typeof(D)=="function"then
z[C]=D()
end
end
end
end

function t.UpdateDPI(y,z,B)
if not t.DPIRegistry[z]then
return
end

for C,D in pairs(B)do
t.DPIRegistry[z][C]=D and D or nil
end
end

function t.SetDPIScale(y,z:number)
t.DPIScale=z/100
t.MinSize*=t.DPIScale

for B,C in pairs(t.DPIRegistry)do
for D,E in pairs(C)do
if D=="DPIExclude"or D=="DPIOffset"then
continue
elseif D=="TextSize"then
B[D]=ApplyTextScale(E)
else
B[D]=ApplyDPIScale(E,C.DPIOffset[D])
end
end
end

for B,C in pairs(t.Tabs)do
if C.IsKeyTab then
continue
end

C:Resize(true)
for D,E in pairs(C.Groupboxes)do
E:Resize()
end
for D,E in pairs(C.Tabboxes)do
for F,G in pairs(E.Tabs)do
G:Resize()
end
end
end

for B,C in pairs(s)do
if C.Type=="Dropdown"then
C:RecalculateListSize()
elseif C.Type=="KeyPicker"then
C:Update()
end
end

t:UpdateKeybindFrame()
for B,C in pairs(t.Notifications)do
C:Resize()
end
end

function t.GiveSignal(y,z:RBXScriptConnection)
table.insert(t.Signals,z)
return z
end

local y,z=pcall(function()
return loadstring(
game:HttpGet"https://raw.githubusercontent.com/deividcomsono/lucide-roblox-direct/refs/heads/main/source.lua"
)()
end)
function t.GetIcon(B,C:string)
if not C or C==""then
return
end


if tonumber(C)then
return{
Url="rbxassetid://"..C,
ImageRectOffset=Vector2.new(0,0),
ImageRectSize=Vector2.new(0,0)
}
end


if not y then
return
end
local D,E=pcall(z.GetAsset,C)
if not D then
return
end
return E
end

function t.Validate(B,C:{[string]:any},D:{[string]:any}):{[string]:any}
if typeof(C)~="table"then
return D
end

for E,F in pairs(D)do
if typeof(E)=="number"then
continue
end

if typeof(F)=="table"then
C[E]=t:Validate(C[E],F)
elseif C[E]==nil then
C[E]=F
end
end

return C
end


local function FillInstance(B:{[string]:any},C:GuiObject)
local D=t.Registry[C]or{}
local E=t.DPIRegistry[C]or{}

local F=E.DPIExclude or B.DPIExclude or{}
local G=E.DPIOffset or B.DPIOffset or{}

for H,I in pairs(B)do
if H=="DPIExclude"or H=="DPIOffset"then
continue
elseif D[H]then
D[H]=nil
elseif H~="Text"and(t.Scheme[I]or typeof(I)=="function")then

D[H]=I
C[H]=t.Scheme[I]or I()
continue
end

if not F[H]then
if H=="Position"or H=="Size"or H:match"Padding"then
E[H]=I
I=ApplyDPIScale(I,G[H])
elseif H=="TextSize"then
E[H]=I
I=ApplyTextScale(I)
end
end

C[H]=I
end

if GetTableSize(D)>0 then
t.Registry[C]=D
end
if GetTableSize(E)>0 then
E.DPIExclude=F
E.DPIOffset=G
t.DPIRegistry[C]=E
end
end

local function New(B:string,C:{[string]:any}):any
local D=Instance.new(B)

if v[B]then
FillInstance(v[B],D)
end
FillInstance(C,D)


if(B=="TextLabel"or B=="TextButton"or B=="TextBox")and not C.TextColor3 then
D.TextColor3=t.Scheme.FontColor

t.Registry[D]=t.Registry[D]or{}
t.Registry[D].TextColor3="FontColor"
end

if C.Parent and not C.ZIndex then
pcall(function()
D.ZIndex=C.Parent.ZIndex
end)
end

return D
end


local function SafeParentUI(B:Instance,C:Instance|(()->Instance))
if
not pcall(function()
if not C then
C=b
end

local D
if typeof(C)=="function"then
D=C()
else
D=C
end

B.Parent=D
end)
then
B.Parent=t.LocalPlayer:WaitForChild("PlayerGui",math.huge)
end
end

local function ParentUI(B:Instance,C:boolean?)
if C then
SafeParentUI(B,b)
return
end

pcall(l,B)

SafeParentUI(B,m)
end

local B=New("ScreenGui",{
Name="Obsidian",
DisplayOrder=999,
ResetOnSpawn=false,
})
ParentUI(B)
t.ScreenGui=B
B.DescendantRemoving:Connect(function(C)
t:RemoveFromRegistry(C)
t.DPIRegistry[C]=nil
end)

local C=New("ScreenGui",{
Name="ObsidanModal",
DisplayOrder=999,
ResetOnSpawn=false,
})
ParentUI(C,true)

local D=New("TextButton",{
BackgroundTransparency=1,
Modal=false,
Size=UDim2.fromScale(0,0),
Text="",
ZIndex=-999,
Parent=C,
})


local E
do
E=New("Frame",{
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundColor3="White",
Size=UDim2.fromOffset(9,1),
Visible=false,
ZIndex=999,
Parent=B,
})
New("Frame",{
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundColor3="Dark",
Position=UDim2.fromScale(0.5,0.5),
Size=UDim2.new(1,2,1,2),
ZIndex=998,
Parent=E,
})

local F=New("Frame",{
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundColor3="White",
Position=UDim2.fromScale(0.5,0.5),
Size=UDim2.fromOffset(1,9),
Parent=E,
})
New("Frame",{
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundColor3="Dark",
Position=UDim2.fromScale(0.5,0.5),
Size=UDim2.new(1,2,1,2),
ZIndex=998,
Parent=F,
})
end


local F
local G
do
F=New("Frame",{
AnchorPoint=Vector2.new(1,0),
BackgroundTransparency=1,
Position=UDim2.new(1,-10,0.5,0),
Size=UDim2.new(0,300,1,-6),
Parent=B,
})
G=New("UIListLayout",{
HorizontalAlignment=Enum.HorizontalAlignment.Right,
Padding=UDim.new(0,6),
Parent=F,
})
end


function t.GetBetterColor(H,I:Color3,J:number):Color3
J=J*(t.IsLightTheme and-4 or 2)
return Color3.fromRGB(
math.clamp(I.R*255+J,0,255),
math.clamp(I.G*255+J,0,255),
math.clamp(I.B*255+J,0,255)
)
end

function t.GetDarkerColor(H,I:Color3):Color3
local J,K,L=I:ToHSV()
return Color3.fromHSV(J,K,L/2)
end

function t.GetKeyString(H,I:Enum.KeyCode)
if I.EnumType==Enum.KeyCode and I.Value>33 and I.Value<127 then
return string.char(I.Value)
end

return I.Name
end

function t.GetTextBounds(H,I:string,J:Font,K:number,L:number?):(number,number)
local M=Instance.new"GetTextBoundsParams"
M.Text=I
M.RichText=true
M.Font=J
M.Size=K
M.Width=L or workspace.CurrentCamera.ViewportSize.X-32

local N=g:GetTextBoundsAsync(M)
return N.X,N.Y
end

function t.MouseIsOverFrame(H,I:GuiObject,J:Vector2):boolean
local K,L=I.AbsolutePosition,I.AbsoluteSize
return J.X>=K.X
and J.X<=K.X+L.X
and J.Y>=K.Y
and J.Y<=K.Y+L.Y
end

function t.SafeCallback(H,I:(...any)->...any,...:any)
if not(I and typeof(I)=="function")then
return
end

local J=table.pack(xpcall(I,function(J)
task.defer(error,debug.traceback(J,2))
if t.NotifyOnError then
t:Notify(J)
end

return J
end,...))

if not J[1]then
return nil
end

return table.unpack(J,2,J.n)
end

function t.MakeDraggable(H,I:GuiObject,J:GuiObject,K:boolean?,L:boolean?)
local M
local N
local O=false
local P
J.InputBegan:Connect(function(Q:InputObject)
if not IsClickInput(Q)or L and t.CantDragForced then
return
end

M=Q.Position
N=I.Position
O=true

P=Q.Changed:Connect(function()
if Q.UserInputState~=Enum.UserInputState.End then
return
end

O=false
if P and P.Connected then
P:Disconnect()
P=nil
end
end)
end)
t:GiveSignal(f.InputChanged:Connect(function(Q:InputObject)
if
(not K and not t.Toggled)
or(L and t.CantDragForced)
or not(B and B.Parent)
then
O=false
if P and P.Connected then
P:Disconnect()
P=nil
end

return
end

if O and IsHoverInput(Q)then
local R=Q.Position-M
I.Position=
UDim2.new(N.X.Scale,N.X.Offset+R.X,N.Y.Scale,N.Y.Offset+R.Y)
end
end))
end

function t.MakeResizable(H,I:GuiObject,J:GuiObject,K:(()->())?)
local L
local M
local N=false
local O
J.InputBegan:Connect(function(P:InputObject)
if not IsClickInput(P)then
return
end

L=P.Position
M=I.Size
N=true

O=P.Changed:Connect(function()
if P.UserInputState~=Enum.UserInputState.End then
return
end

N=false
if O and O.Connected then
O:Disconnect()
O=nil
end
end)
end)
t:GiveSignal(f.InputChanged:Connect(function(P:InputObject)
if not I.Visible or not(B and B.Parent)then
N=false
if O and O.Connected then
O:Disconnect()
O=nil
end

return
end

if N and IsHoverInput(P)then
local Q=P.Position-L
I.Size=UDim2.new(
M.X.Scale,
math.clamp(M.X.Offset+Q.X,t.MinSize.X,math.huge),
M.Y.Scale,
math.clamp(M.Y.Offset+Q.Y,t.MinSize.Y,math.huge)
)
if K then
t:SafeCallback(K)
end
end
end))
end

function t.MakeCover(H,I:GuiObject,J:string)
local K=w[J]or{0,0}
local L=x[J]or{1,0.5}

local M=New("Frame",{
AnchorPoint=Vector2.new(K[1],K[2]),
BackgroundColor3=I.BackgroundColor3,
Position=UDim2.fromScale(K[1],K[2]),
Size=UDim2.fromScale(L[1],L[2]),
Parent=I,
})

return M
end

function t.MakeLine(H,I:GuiObject,J)
local K=New("Frame",{
AnchorPoint=J.AnchorPoint or Vector2.zero,
BackgroundColor3="OutlineColor",
Position=J.Position,
Size=J.Size,
Parent=I,
})

return K
end

function t.MakeOutline(H,I:GuiObject,J:number?,K:number?)
local L=New("Frame",{
BackgroundColor3="Dark",
Position=UDim2.fromOffset(-2,-2),
Size=UDim2.new(1,4,1,4),
ZIndex=K,
Parent=I,
})

local M=New("Frame",{
BackgroundColor3="OutlineColor",
Position=UDim2.fromOffset(1,1),
Size=UDim2.new(1,-2,1,-2),
ZIndex=K,
Parent=L,
})

if J and J>0 then
New("UICorner",{
CornerRadius=UDim.new(0,J+1),
Parent=L,
})
New("UICorner",{
CornerRadius=UDim.new(0,J),
Parent=M,
})
end

return L
end

function t.AddDraggableButton(H,I:string,J)
local K={}

local L=New("TextButton",{
BackgroundColor3="BackgroundColor",
Position=UDim2.fromOffset(6,6),
TextSize=16,
ZIndex=10,
Parent=B,

DPIExclude={
Position=true,
},
})
New("UICorner",{
CornerRadius=UDim.new(0,t.CornerRadius-1),
Parent=L,
})
t:MakeOutline(L,t.CornerRadius,9)

K.Button=L
L.MouseButton1Click:Connect(function()
t:SafeCallback(J,K)
end)
t:MakeDraggable(L,L,true)

function K.SetText(M,N:string)
local O,P=t:GetTextBounds(N,t.Scheme.Font,16)

L.Text=N
L.Size=UDim2.fromOffset(O*t.DPIScale*2,P*t.DPIScale*2)
t:UpdateDPI(L,{
Size=UDim2.fromOffset(O*2,P*2),
})
end
K:SetText(I)

return K
end

function t.AddDraggableMenu(H,I:string)
local J=t:MakeOutline(B,t.CornerRadius,10)
J.AutomaticSize=Enum.AutomaticSize.Y
J.Position=UDim2.fromOffset(6,6)
J.Size=UDim2.fromOffset(0,0)
t:UpdateDPI(J,{
Position=false,
Size=false,
})

local K=New("Frame",{
BackgroundColor3="BackgroundColor",
Position=UDim2.fromOffset(2,2),
Size=UDim2.new(1,-4,1,-4),
Parent=J,
})
New("UICorner",{
CornerRadius=UDim.new(0,t.CornerRadius-1),
Parent=K,
})
t:MakeLine(K,{
Position=UDim2.fromOffset(0,34),
Size=UDim2.new(1,0,0,1),
})

local L=New("TextLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,34),
Text=I,
TextSize=15,
TextXAlignment=Enum.TextXAlignment.Left,
Parent=K,
})
New("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
Parent=L,
})

local M=New("Frame",{
BackgroundTransparency=1,
Position=UDim2.fromOffset(0,35),
Size=UDim2.new(1,0,1,-35),
Parent=K,
})
New("UIListLayout",{
Padding=UDim.new(0,7),
Parent=M,
})
New("UIPadding",{
PaddingBottom=UDim.new(0,7),
PaddingLeft=UDim.new(0,7),
PaddingRight=UDim.new(0,7),
PaddingTop=UDim.new(0,7),
Parent=M,
})

t:MakeDraggable(J,L,true)
return J,M
end


do
local H=t:MakeOutline(B,t.CornerRadius,10)
H.AutomaticSize=Enum.AutomaticSize.Y
H.Position=UDim2.fromOffset(6,6)
H.Size=UDim2.fromOffset(0,0)
H.Visible=false

t:UpdateDPI(H,{
Position=false,
Size=false,
})

local I=New("Frame",{
BackgroundColor3="BackgroundColor",
Position=UDim2.fromOffset(2,2),
Size=UDim2.new(1,-4,1,-4),
Parent=H,
})
New("UICorner",{
CornerRadius=UDim.new(0,t.CornerRadius-1),
Parent=I,
})

local J=New("TextLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,32),
Position=UDim2.fromOffset(0,-8*t.DPIScale+7),
Text="",
TextSize=15,
TextXAlignment=Enum.TextXAlignment.Left,
Parent=I,
})
New("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
Parent=J,
})

t:MakeDraggable(H,J,true)

local function ResizeWatermark()
local K,L=t:GetTextBounds(J.Text,t.Scheme.Font,15)
H.Size=UDim2.fromOffset((12+K+12+4)*t.DPIScale,L*t.DPIScale*2+4)
t:UpdateDPI(H,{
Size=UDim2.fromOffset(12+K+12+4,L*2+4),
})
end

function t.SetWatermarkVisibility(K,L:boolean)
H.Visible=L
if L then
ResizeWatermark()
end
end

function t.SetWatermark(K,L:string)
J.Text=L
ResizeWatermark()
end
end


local H
function t.AddContextMenu(I
,J:GuiObject
,K:UDim2|(()->())
,L:{[number]:number}|(()->{})
,M:number?,
N:((Active:boolean)->())?
)
local O
if M then
O=New("ScrollingFrame",{
AutomaticCanvasSize=M==2 and Enum.AutomaticSize.Y or Enum.AutomaticSize.None,
AutomaticSize=M==1 and Enum.AutomaticSize.Y or Enum.AutomaticSize.None,
BackgroundColor3="BackgroundColor",
BorderColor3="OutlineColor",
BorderSizePixel=1,
BottomImage="rbxasset://textures/ui/Scroll/scroll-middle.png",
CanvasSize=UDim2.fromOffset(0,0),
ScrollBarImageColor3="OutlineColor",
ScrollBarThickness=M==2 and 2 or 0,
Size=typeof(K)=="function"and K()or K,
TopImage="rbxasset://textures/ui/Scroll/scroll-middle.png",
Visible=false,
ZIndex=10,
Parent=B,

DPIExclude={
Position=true,
},
})
else
O=New("Frame",{
BackgroundColor3="BackgroundColor",
BorderColor3="OutlineColor",
BorderSizePixel=1,
Size=typeof(K)=="function"and K()or K,
Visible=false,
ZIndex=10,
Parent=B,

DPIExclude={
Position=true,
},
})
end

local P={
Active=false,
Holder=J,
Menu=O,
List=nil,
Signal=nil,

Size=K,
}

if M then
P.List=New("UIListLayout",{
Parent=O,
})
end

function P.Open(Q)
if H==P then
return
elseif H then
H:Close()
end

H=P
P.Active=true

if typeof(L)=="function"then
O.Position=UDim2.fromOffset(
math.floor(J.AbsolutePosition.X+L()[1]),
math.floor(J.AbsolutePosition.Y+L()[2])
)
else
O.Position=UDim2.fromOffset(
math.floor(J.AbsolutePosition.X+L[1]),
math.floor(J.AbsolutePosition.Y+L[2])
)
end
if typeof(P.Size)=="function"then
O.Size=P.Size()
else
O.Size=ApplyDPIScale(P.Size)
end
if typeof(N)=="function"then
t:SafeCallback(N,true)
end

O.Visible=true

P.Signal=J:GetPropertyChangedSignal"AbsolutePosition":Connect(function()
if typeof(L)=="function"then
O.Position=UDim2.fromOffset(
math.floor(J.AbsolutePosition.X+L()[1]),
math.floor(J.AbsolutePosition.Y+L()[2])
)
else
O.Position=UDim2.fromOffset(
math.floor(J.AbsolutePosition.X+L[1]),
math.floor(J.AbsolutePosition.Y+L[2])
)
end
end)
end

function P.Close(Q)
if H~=P then
return
end
O.Visible=false

if P.Signal then
P.Signal:Disconnect()
P.Signal=nil
end
P.Active=false
H=nil
if typeof(N)=="function"then
t:SafeCallback(N,false)
end
end

function P.Toggle(Q)
if P.Active then
P:Close()
else
P:Open()
end
end

function P.SetSize(Q,R)
P.Size=R
O.Size=typeof(R)=="function"and R()or R
end

return P
end

t:GiveSignal(f.InputBegan:Connect(function(I:InputObject)
if IsClickInput(I,true)then
local J=I.Position

if
H
and not(
t:MouseIsOverFrame(H.Menu,J)
or t:MouseIsOverFrame(H.Holder,J)
)
then
H:Close()
end
end
end))


local I=New("TextLabel",{
BackgroundColor3="BackgroundColor",
BorderColor3="OutlineColor",
BorderSizePixel=1,
TextSize=14,
TextWrapped=true,
Visible=false,
ZIndex=20,
Parent=B,
})
I:GetPropertyChangedSignal"AbsolutePosition":Connect(function()
local J,K=t:GetTextBounds(
I.Text,
I.FontFace,
I.TextSize,
workspace.CurrentCamera.ViewportSize.X-I.AbsolutePosition.X-4
)

I.Size=UDim2.fromOffset(J+8*t.DPIScale,K+4*t.DPIScale)
t:UpdateDPI(I,{
Size=UDim2.fromOffset(J,K),
DPIOffset={
Size={8,4},
},
})
end)

local J
function t.AddTooltip(K,L:string,M:string,N:GuiObject)
local O={
Disabled=false,
Hovering=false,
Signals={},
}

local function DoHover()
if
J==N
or(H and t:MouseIsOverFrame(H.Menu,o))
or(O.Disabled and typeof(M)~="string")
or(not O.Disabled and typeof(L)~="string")
then
return
end
J=N

I.Text=O.Disabled and M or L
I.Visible=true

while
t.Toggled
and t:MouseIsOverFrame(N,o)
and not(H and t:MouseIsOverFrame(H.Menu,o))
do
I.Position=UDim2.fromOffset(
o.X+(t.ShowCustomCursor and 8 or 14),
o.Y+(t.ShowCustomCursor and 8 or 12)
)

d.RenderStepped:Wait()
end

I.Visible=false
J=nil
end

table.insert(O.Signals,N.MouseEnter:Connect(DoHover))
table.insert(O.Signals,N.MouseMoved:Connect(DoHover))
table.insert(
O.Signals,
N.MouseLeave:Connect(function()
if J~=N then
return
end

I.Visible=false
J=nil
end)
)

function O.Destroy(P)
for Q=#O.Signals,1,-1 do
local R=table.remove(O.Signals,Q)
R:Disconnect()
end

if J==N then
I.Visible=false
J=nil
end
end

return O
end

function t.OnUnload(K,L)
table.insert(t.UnloadSignals,L)
end

function t.Unload(K)
for L=#t.Signals,1,-1 do
local M=table.remove(t.Signals,L)
M:Disconnect()
end

for L,M in pairs(t.UnloadSignals)do
t:SafeCallback(M)
end

t.Unloaded=true
B:Destroy()
C:Destroy()
j().Library=nil
end

local K=t:GetIcon"check"
local L=t:GetIcon"chevron-up"
local M=t:GetIcon"move-diagonal-2"
local N=t:GetIcon"key"

local O={}
do
local P={}

function P.AddKeyPicker(Q,R,S)
S=t:Validate(S,v.KeyPicker)

local T=Q
local U=T.TextLabel

local V={
Text=S.Text,
Value=S.Default,
Toggled=false,
Mode=S.Mode,
SyncToggleState=S.SyncToggleState,

Callback=S.Callback,
ChangedCallback=S.ChangedCallback,
Changed=S.Changed,
Clicked=S.Clicked,

Type="KeyPicker",
}

if V.SyncToggleState then
S.Modes={"Toggle"}
S.Mode="Toggle"
end

local W=New("TextButton",{
BackgroundColor3="MainColor",
BorderColor3="OutlineColor",
BorderSizePixel=1,
Size=UDim2.fromOffset(18,18),
Text=V.Value,
TextSize=14,
Parent=U,
})

local X={
Normal=V.Mode~="Toggle",
}
do
local Y=New("TextButton",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,16),
Text="",
Visible=not S.NoUI,
Parent=t.KeybindContainer,
})

local Z=New("TextLabel",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
Text="",
TextSize=14,
TextTransparency=0.5,
Parent=Y,

DPIExclude={
Size=true,
},
})

local _=New("Frame",{
BackgroundColor3="MainColor",
Size=UDim2.fromOffset(14,14),
SizeConstraint=Enum.SizeConstraint.RelativeYY,
Parent=Y,
})
New("UICorner",{
CornerRadius=UDim.new(0,t.CornerRadius/2),
Parent=_,
})
New("UIStroke",{
Color="OutlineColor",
Parent=_,
})

local aa=New("ImageLabel",{
Image=K and K.Url or"",
ImageColor3="FontColor",
ImageRectOffset=K and K.ImageRectOffset or Vector2.zero,
ImageRectSize=K and K.ImageRectSize or Vector2.zero,
ImageTransparency=1,
Position=UDim2.fromOffset(2,2),
Size=UDim2.new(1,-4,1,-4),
Parent=_,
})

function X.Display(ab,ac)
Z.TextTransparency=ac and 0 or 0.5
aa.ImageTransparency=ac and 0 or 1
end

function X.SetText(ab,ac)
local ad=t:GetTextBounds(ac,Z.FontFace,Z.TextSize)
Z.Text=ac
Z.Size=UDim2.new(0,ad,1,0)
end

function X.SetVisibility(ab,ac)
Y.Visible=ac
end

function X.SetNormal(ab,ac)
X.Normal=ac

Y.Active=not ac
Z.Position=ac and UDim2.fromOffset(0,0)or UDim2.fromOffset(22*t.DPIScale,0)
_.Visible=not ac
end

Y.MouseButton1Click:Connect(function()
if X.Normal then
return
end

V.Toggled=not V.Toggled
V:DoClick()
end)

X.Holder=Y
X.Label=Z
X.Checkbox=_
X.Loaded=true
table.insert(t.KeybindToggles,X)
end

local aa=t:AddContextMenu(W,UDim2.fromOffset(62,0),function()
return{W.AbsoluteSize.X+1.5,0.5}
end,1)
V.Menu=aa

local ab={}
for ac,ad in pairs(S.Modes)do
local Y={}

local Z=New("TextButton",{
BackgroundColor3="MainColor",
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,21),
Text=ad,
TextSize=14,
TextTransparency=0.5,
Parent=aa.Menu,
})

function Y.Select(_)
for ae,af in pairs(ab)do
af:Deselect()
end

V.Mode=ad

Z.BackgroundTransparency=0
Z.TextTransparency=0

aa:Close()
end

function Y.Deselect(ae)
V.Mode=nil

Z.BackgroundTransparency=1
Z.TextTransparency=0.5
end

Z.MouseButton1Click:Connect(function()
Y:Select()
end)

if V.Mode==ad then
Y:Select()
end

ab[ad]=Y
end

function V.Display(ac)
if t.Unloaded then
return
end

local ad,ae=
t:GetTextBounds(V.Value,W.FontFace,W.TextSize,U.AbsoluteSize.X)
W.Text=V.Value
W.Size=UDim2.fromOffset(ad+9*t.DPIScale,ae+4*t.DPIScale)
end

function V.Update(ac)
V:Display()

if S.NoUI then
return
end

if V.Mode=="Toggle"and T.Type=="Toggle"and T.Disabled then
X:SetVisibility(false)
return
end

local ad=V:GetState()
local ae=t.ShowToggleFrameInKeybinds and V.Mode=="Toggle"

if X.Loaded then
if ae then
X:SetNormal(false)
else
X:SetNormal(true)
end

X:SetText(("[%s] %s (%s)"):format(V.Value,V.Text,V.Mode))
X:SetVisibility(true)
X:Display(ad)
end

t:UpdateKeybindFrame()
end

function V.GetState(ac)
if V.Mode=="Always"then
return true
elseif V.Mode=="Hold"then
local ad=V.Value
if ad=="None"then
return false
end

if ad=="MB1"or ad=="MB2"then
return ad=="MB1"and f:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
or ad=="MB2"and f:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
end

return f:IsKeyDown(Enum.KeyCode[V.Value])
and not f:GetFocusedTextBox()
else
return V.Toggled
end
end

function V.OnChanged(ac,ad)
V.Changed=ad
end

function V.OnClick(ac,ad)
V.Clicked=ad
end

function V.DoClick(ac)
if T.Type=="Toggle"and V.SyncToggleState then
T:SetValue(V.Toggled)
end

t:SafeCallback(V.Callback,V.Toggled)
t:SafeCallback(V.Changed,V.Toggled)
end

function V.SetValue(ac,ad)
local ae,af=ad[1],ad[2]

V.Value=ae
if ab[af]then
ab[af]:Select()
end

V:Update()
end

function V.SetText(ac,ad)
X:SetText(ad)
V:Update()
end

local ac=false
W.MouseButton1Click:Connect(function()
if ac then
return
end

ac=true

W.Text="..."
W.Size=UDim2.fromOffset(29*t.DPIScale,18*t.DPIScale)

local ad=f.InputBegan:Wait()
local ae="Unknown"

if ad.UserInputType==Enum.UserInputType.Keyboard then
ae=ad.KeyCode==Enum.KeyCode.Escape and"None"or ad.KeyCode.Name
elseif ad.UserInputType==Enum.UserInputType.MouseButton1 then
ae="MB1"
elseif ad.UserInputType==Enum.UserInputType.MouseButton2 then
ae="MB2"
end

V.Value=ae
V:Update()

t:SafeCallback(
V.ChangedCallback,
ad.KeyCode==Enum.KeyCode.Unknown and ad.UserInputType or ad.KeyCode
)
t:SafeCallback(
V.Changed,
ad.KeyCode==Enum.KeyCode.Unknown and ad.UserInputType or ad.KeyCode
)

d.RenderStepped:Wait()
ac=false
end)
W.MouseButton2Click:Connect(aa.Toggle)

t:GiveSignal(f.InputBegan:Connect(function(ad:InputObject)
if
V.Mode=="Always"
or V.Value=="Unknown"
or V.Value=="None"
or ac
or f:GetFocusedTextBox()
then
return
end

if V.Mode=="Toggle"then
local ae=V.Value

if ae=="MB1"or ae=="MB2"then
if
ae=="MB1"and f:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
or ae=="MB2"and f:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
then
V.Toggled=not V.Toggled
V:DoClick()
end
elseif ad.UserInputType==Enum.UserInputType.Keyboard and ad.KeyCode.Name==ae then
V.Toggled=not V.Toggled
V:DoClick()
end
end

V:Update()
end))

t:GiveSignal(f.InputEnded:Connect(function()
if
V.Value=="Unknown"
or V.Value=="None"
or ac
or f:GetFocusedTextBox()
then
return
end

V:Update()
end))

V:Update()

if T.Addons then
table.insert(T.Addons,V)
end

s[R]=V

return Q
end

local aa={}
for ab=0,1,0.1 do
table.insert(aa,ColorSequenceKeypoint.new(ab,Color3.fromHSV(ab,1,1)))
end
function P.AddColorPicker(ab,ac,ad)
ad=t:Validate(ad,v.ColorPicker)

local ae=ab
local af=ae.TextLabel

local Q={
Value=ad.Default,
Transparency=ad.Transparency or 0,

Callback=ad.Callback,
Changed=ad.Changed,

Type="ColorPicker",
}
Q.Hue,Q.Sat,Q.Vib=Q.Value:ToHSV()

local R=New("TextButton",{
BackgroundColor3=Q.Value,
BorderColor3=t:GetDarkerColor(Q.Value),
BorderSizePixel=1,
Size=UDim2.fromOffset(18,18),
Text="",
Parent=af,
})

local S=New("ImageLabel",{
Image=u.GetAsset"TransparencyTexture",
ImageTransparency=(1-Q.Transparency),
ScaleType=Enum.ScaleType.Tile,
Size=UDim2.fromScale(1,1),
TileSize=UDim2.fromOffset(9,9),
Parent=R,
})


local T=t:AddContextMenu(
R,
UDim2.fromOffset(ad.Transparency and 256 or 234,0),
function()
return{0.5,R.AbsoluteSize.Y+1.5}
end,
1
)
T.List.Padding=UDim.new(0,8)
Q.ColorMenu=T

New("UIPadding",{
PaddingBottom=UDim.new(0,6),
PaddingLeft=UDim.new(0,6),
PaddingRight=UDim.new(0,6),
PaddingTop=UDim.new(0,6),
Parent=T.Menu,
})

if typeof(ad.Title)=="string"then
New("TextLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,8),
Text=ad.Title,
TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,
Parent=T.Menu,
})
end

local U=New("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,200),
Parent=T.Menu,
})
New("UIListLayout",{
FillDirection=Enum.FillDirection.Horizontal,
Padding=UDim.new(0,6),
Parent=U,
})


local V=New("ImageButton",{
BackgroundColor3=Q.Value,
Image=u.GetAsset"SaturationMap",
Size=UDim2.fromOffset(200,200),
Parent=U,
})

local W=New("Frame",{
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundColor3="White",
Size=UDim2.fromOffset(6,6),
Parent=V,
})
New("UICorner",{
CornerRadius=UDim.new(1,0),
Parent=W,
})
New("UIStroke",{
Color="Dark",
Parent=W,
})


local X=New("TextButton",{
Size=UDim2.fromOffset(16,200),
Text="",
Parent=U,
})
New("UIGradient",{
Color=ColorSequence.new(aa),
Rotation=90,
Parent=X,
})

local Y=New("Frame",{
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundColor3="White",
BorderColor3="Dark",
BorderSizePixel=1,
Position=UDim2.fromScale(0.5,Q.Hue),
Size=UDim2.new(1,2,0,1),
Parent=X,
})


local Z,_,ag
if ad.Transparency then
Z=New("ImageButton",{
Image=u.GetAsset"TransparencyTexture",
ScaleType=Enum.ScaleType.Tile,
Size=UDim2.fromOffset(16,200),
TileSize=UDim2.fromOffset(8,8),
Parent=U,
})

_=New("Frame",{
BackgroundColor3=Q.Value,
Size=UDim2.fromScale(1,1),
Parent=Z,
})
New("UIGradient",{
Rotation=90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
},
Parent=_,
})

ag=New("Frame",{
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundColor3="White",
BorderColor3="Dark",
BorderSizePixel=1,
Position=UDim2.fromScale(0.5,Q.Transparency),
Size=UDim2.new(1,2,0,1),
Parent=Z,
})
end

local ah=New("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,20),
Parent=T.Menu,
})
New("UIListLayout",{
FillDirection=Enum.FillDirection.Horizontal,
HorizontalFlex=Enum.UIFlexAlignment.Fill,
Padding=UDim.new(0,8),
Parent=ah,
})

local ai=New("TextBox",{
BackgroundColor3="MainColor",
BorderColor3="OutlineColor",
BorderSizePixel=1,
ClearTextOnFocus=false,
Size=UDim2.fromScale(1,1),
Text="#??????",
TextSize=14,
Parent=ah,
})

local aj=New("TextBox",{
BackgroundColor3="MainColor",
BorderColor3="OutlineColor",
BorderSizePixel=1,
ClearTextOnFocus=false,
Size=UDim2.fromScale(1,1),
Text="?, ?, ?",
TextSize=14,
Parent=ah,
})


local ak=t:AddContextMenu(R,UDim2.fromOffset(93,0),function()
return{R.AbsoluteSize.X+1.5,0.5}
end,1)
Q.ContextMenu=ak
do
local function CreateButton(al,am)
local an=New("TextButton",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,21),
Text=al,
TextSize=14,
Parent=ak.Menu,
})

an.MouseButton1Click:Connect(function()
t:SafeCallback(am)
ak:Close()
end)
end

CreateButton("Copy color",function()
t.CopiedColor={Q.Value,Q.Transparency}
end)

CreateButton("Paste color",function()
Q:SetValueRGB(t.CopiedColor[1],t.CopiedColor[2])
end)

if k then
CreateButton("Copy Hex",function()
k(tostring(Q.Value:ToHex()))
end)
CreateButton("Copy RGB",function()
k(table.concat({
math.floor(Q.Value.R*255),
math.floor(Q.Value.G*255),
math.floor(Q.Value.B*255),
},", "))
end)
end
end



function Q.SetHSVFromRGB(al,am)
Q.Hue,Q.Sat,Q.Vib=am:ToHSV()
end

function Q.Display(al)
if t.Unloaded then
return
end

Q.Value=Color3.fromHSV(Q.Hue,Q.Sat,Q.Vib)

R.BackgroundColor3=Q.Value
R.BorderColor3=t:GetDarkerColor(Q.Value)
S.ImageTransparency=(1-Q.Transparency)

V.BackgroundColor3=Color3.fromHSV(Q.Hue,1,1)
if _ then
_.BackgroundColor3=Q.Value
end

W.Position=UDim2.fromScale(Q.Sat,1-Q.Vib)
Y.Position=UDim2.fromScale(0.5,Q.Hue)
if ag then
ag.Position=UDim2.fromScale(0.5,Q.Transparency)
end

ai.Text="#"..Q.Value:ToHex()
aj.Text=table.concat({
math.floor(Q.Value.R*255),
math.floor(Q.Value.G*255),
math.floor(Q.Value.B*255),
},", ")
end

function Q.Update(al)
Q:Display()

t:SafeCallback(Q.Callback,Q.Value)
t:SafeCallback(Q.Changed,Q.Value)
end

function Q.OnChanged(al,am)
Q.Changed=am
end

function Q.SetValue(al,am,an)
local ao=Color3.fromHSV(am[1],am[2],am[3])

Q.Transparency=ad.Transparency and an or 0
Q:SetHSVFromRGB(ao)
Q:Update()
end

function Q.SetValueRGB(al,am,an)
Q.Transparency=ad.Transparency and an or 0
Q:SetHSVFromRGB(am)
Q:Update()
end

R.MouseButton1Click:Connect(T.Toggle)
R.MouseButton2Click:Connect(ak.Toggle)

V.InputBegan:Connect(function(al:InputObject)
while IsClickInput(al)do
local am=V.AbsolutePosition.X
local an=am+V.AbsoluteSize.X
local ao=math.clamp(o.X,am,an)

local ap=V.AbsolutePosition.Y
local aq=ap+V.AbsoluteSize.Y
local ar=math.clamp(o.Y,ap,aq)

local as=Q.Sat
local at=Q.Vib
Q.Sat=(ao-am)/(an-am)
Q.Vib=1-((ar-ap)/(aq-ap))

if Q.Sat~=as or Q.Vib~=at then
Q:Update()
end

d.RenderStepped:Wait()
end
end)
X.InputBegan:Connect(function(al:InputObject)
while IsClickInput(al)do
local am=X.AbsolutePosition.Y
local an=am+X.AbsoluteSize.Y
local ao=math.clamp(o.Y,am,an)

local ap=Q.Hue
Q.Hue=(ao-am)/(an-am)

if Q.Hue~=ap then
Q:Update()
end

d.RenderStepped:Wait()
end
end)
if Z then
Z.InputBegan:Connect(function(al:InputObject)
while IsClickInput(al)do
local am=Z.AbsolutePosition.Y
local an=Z.AbsolutePosition.Y+Z.AbsoluteSize.Y
local ao=math.clamp(o.Y,am,an)

local ap=Q.Transparency
Q.Transparency=(ao-am)/(an-am)

if Q.Transparency~=ap then
Q:Update()
end

d.RenderStepped:Wait()
end
end)
end

ai.FocusLost:Connect(function(al)
if not al then
return
end

local am,an=pcall(Color3.fromHex,ai.Text)
if am and typeof(an)=="Color3"then
Q.Hue,Q.Sat,Q.Vib=an:ToHSV()
end

Q:Update()
end)
aj.FocusLost:Connect(function(al)
if not al then
return
end

local am,an,ao=aj.Text:match"(%d+),%s*(%d+),%s*(%d+)"
if am and an and ao then
Q:SetHSVFromRGB(Color3.fromRGB(am,an,ao))
end

Q:Update()
end)

Q:Display()

if ae.Addons then
table.insert(ae.Addons,Q)
end

s[ac]=Q

return ab
end

O.__index=P
O.__namecall=function(ab,ac,...)
return P[ac](...)
end
end

local aa={}
do
local ab={}

function ab.AddDivider(ac)
local ad=ac
local ae=ad.Container

local af=New("Frame",{
BackgroundColor3="MainColor",
BorderColor3="OutlineColor",
BorderSizePixel=1,
Size=UDim2.new(1,0,0,2),
Parent=ae,
})

ad:Resize()

table.insert(ad.Elements,{
Holder=af,
Type="Divider",
})
end

function ab.AddLabel(ac,...)
local ad={}

local ae=select(1,...)
local af=select(2,...)

if typeof(ae)=="table"or typeof(af)=="table"then
local ag=typeof(ae)=="table"and ae or af

ad.Text=ag.Text or""
ad.DoesWrap=ag.DoesWrap or false
ad.Size=ag.Size or 14
ad.Visible=ag.Visible or true
ad.Idx=typeof(af)=="table"and ae or nil


ad.ColumnCount=ag.ColumnCount or 2
ad.ColumnSpacing=ag.ColumnSpacing or 4
ad.ColumnHeaders=ag.ColumnHeaders or nil
ad.ColumnWidthMode=ag.ColumnWidthMode or"auto"
ad.ColumnAlignment=ag.ColumnAlignment or"left"
ad.ColumnSeparator=ag.ColumnSeparator or" | "
ad.ColumnWidths=ag.ColumnWidths or nil
ad.UseColumns=ag.UseColumns or false
ad.UseUIColumns=ag.UseUIColumns or false
ad.ColumnHeight=ag.ColumnHeight or 20
ad.ColumnPadding=ag.ColumnPadding or 5
ad.ColumnDividerColor=ag.ColumnDividerColor or nil
ad.ColumnDividerThickness=ag.ColumnDividerThickness or 1
else
ad.Text=ae or""
ad.DoesWrap=af or false
ad.Size=14
ad.Visible=true
ad.Idx=select(3,...)or nil


ad.ColumnCount=2
ad.ColumnSpacing=4
ad.ColumnHeaders=nil
ad.ColumnWidthMode="auto"
ad.ColumnAlignment="left"
ad.ColumnSeparator=" | "
ad.ColumnWidths=nil
ad.UseColumns=false
ad.UseUIColumns=false
ad.ColumnHeight=20
ad.ColumnPadding=5
ad.ColumnDividerColor=nil
ad.ColumnDividerThickness=1
end

local ag=ac
local ah=ag.Container

local ai={
Text=ad.Text,
DoesWrap=ad.DoesWrap,
Visible=ad.Visible,
Type="Label",

ColumnCount=ad.ColumnCount,
ColumnSpacing=ad.ColumnSpacing,
ColumnHeaders=ad.ColumnHeaders,
ColumnWidthMode=ad.ColumnWidthMode,
ColumnAlignment=ad.ColumnAlignment,
ColumnSeparator=ad.ColumnSeparator,
ColumnWidths=ad.ColumnWidths,
UseColumns=ad.UseColumns,
UseUIColumns=ad.UseUIColumns,
ColumnHeight=ad.ColumnHeight,
ColumnPadding=ad.ColumnPadding,
ColumnDividerColor=ad.ColumnDividerColor,
ColumnDividerThickness=ad.ColumnDividerThickness,
}

local aj=New("TextLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,18),
Text="",
TextSize=ad.Size,
TextWrapped=ai.DoesWrap,
TextXAlignment=ag.IsKeyTab and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left,
Parent=ah,
})


local ak=New("Frame",{
Name="ColumnContainer",
BackgroundTransparency=1,
BorderSizePixel=0,
Position=UDim2.new(0,0,0,0),
Size=UDim2.new(1,0,1,0),
ZIndex=aj.ZIndex+1,
Parent=ah,
Visible=false,
})


local function CreateUIColumns(al)

for am,an in pairs(ak:GetChildren())do
an:Destroy()
end

if not al or type(al)~="table"or#al==0 then

New("TextLabel",{
Name="EmptyLabel",
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
ZIndex=aj.ZIndex+2,
Font=Enum.Font.GothamMedium,
Text="No data available",
TextColor3=aj.TextColor3,
TextSize=ad.Size,
TextTransparency=0.500,
TextXAlignment=Enum.TextXAlignment.Center,
TextYAlignment=Enum.TextYAlignment.Center,
Parent=ak,
})
return
end

local am={}


if#al>0 then

for an,ao in ipairs(al)do
table.insert(am,tostring(ao))
end
else

for an,ao in pairs(al)do
table.insert(am,tostring(an)..": "..tostring(ao))
end
end

if#am==0 then
New("TextLabel",{
Name="EmptyLabel",
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
ZIndex=aj.ZIndex+2,
Font=Enum.Font.GothamMedium,
Text="No data available",
TextColor3=aj.TextColor3,
TextSize=ad.Size,
TextTransparency=0.500,
TextXAlignment=Enum.TextXAlignment.Center,
TextYAlignment=Enum.TextYAlignment.Center,
Parent=ak,
})
return
end

local an=ai.ColumnCount or 2
local ao=ai.ColumnSpacing or 4
local ap=ah.AbsoluteSize.X-20


local aq={}
if ai.ColumnWidthMode=="equal"then
local ar=math.floor((ap-(ao*(an-1)))/an)
for as=1,an do
aq[as]=ar
end
elseif ai.ColumnWidthMode=="custom"and ai.ColumnWidths then
aq=ai.ColumnWidths
else

local ar=math.ceil(#am/an)
for as=1,an do
local at=0
for P=1,ar do
local Q=(as-1)*ar+P
if Q<=#am then
at=math.max(at,#am[Q])
end
end
aq[as]=math.max(at*8,80)
end
end


local ar=0
if ai.ColumnHeaders and#ai.ColumnHeaders>0 then
local as=New("Frame",{
Name="HeaderFrame",
BackgroundColor3=Color3.new(0.1,0.1,0.1),
BorderSizePixel=0,
Position=UDim2.new(0,0,0,0),
Size=UDim2.new(1,0,0,ai.ColumnHeight),
ZIndex=aj.ZIndex+2,
Parent=ak,
})


New("Frame",{
Name="HeaderBorder",
BackgroundColor3=ai.ColumnDividerColor or Color3.new(0.3,0.3,0.3),
BorderSizePixel=0,
Position=UDim2.new(0,0,1,0),
Size=UDim2.new(1,0,0,ai.ColumnDividerThickness),
ZIndex=aj.ZIndex+3,
Parent=as,
})


local at=0
for P,Q in ipairs(ai.ColumnHeaders)do

New("TextLabel",{
Name="HeaderCell_"..P,
BackgroundTransparency=1,
Position=UDim2.new(0,at+ai.ColumnPadding,0,0),
Size=UDim2.new(0,aq[P]-ai.ColumnPadding*2,1,0),
ZIndex=aj.ZIndex+3,
Font=Enum.Font.GothamBold,
Text=Q,
TextColor3=aj.TextColor3,
TextSize=ad.Size,
TextTransparency=0.100,
TextXAlignment=Enum.TextXAlignment[ai.ColumnAlignment:gsub("^%l",string.upper)],
TextYAlignment=Enum.TextYAlignment.Center,
Parent=as,
})


if P<#ai.ColumnHeaders then
New("Frame",{
Name="VerticalDivider_"..P,
BackgroundColor3=ai.ColumnDividerColor or Color3.new(0.3,0.3,0.3),
BorderSizePixel=0,
Position=UDim2.new(0,at+aq[P],0,0),
Size=UDim2.new(0,ai.ColumnDividerThickness,1,0),
ZIndex=aj.ZIndex+4,
Parent=as,
})
end

at=at+aq[P]
end

ar=ai.ColumnHeight
end


local as=math.ceil(#am/an)
local at=0

for P=1,an do

local Q=New("Frame",{
Name="Column_"..P,
BackgroundTransparency=1,
BorderSizePixel=0,
Position=UDim2.new(0,at,0,ar),
Size=UDim2.new(0,aq[P],1,-ar),
ZIndex=aj.ZIndex+2,
Parent=ak,
})


for R=1,as do
local S=(P-1)*as+R
if S<=#am then
New("TextLabel",{
Name="Item_"..S,
BackgroundTransparency=1,
Position=UDim2.new(0,ai.ColumnPadding,0,(R-1)*ai.ColumnHeight),
Size=UDim2.new(1,-ai.ColumnPadding*2,0,ai.ColumnHeight),
ZIndex=aj.ZIndex+3,
Font=Enum.Font.GothamMedium,
Text=am[S],
TextColor3=aj.TextColor3,
TextSize=ad.Size-1,
TextTransparency=0.300,
TextXAlignment=Enum.TextXAlignment[ai.ColumnAlignment:gsub("^%l",string.upper)],
TextYAlignment=Enum.TextYAlignment.Center,
TextTruncate=Enum.TextTruncate.AtEnd,
Parent=Q,
})
end
end


if P<an then
New("Frame",{
Name="VerticalDivider_"..P,
BackgroundColor3=ai.ColumnDividerColor or Color3.new(0.3,0.3,0.3),
BackgroundTransparency=0.8,
BorderSizePixel=0,
Position=UDim2.new(0,at+aq[P],0,ar),
Size=UDim2.new(0,ai.ColumnDividerThickness,1,-ar),
ZIndex=aj.ZIndex+4,
Parent=ak,
})
end

at=at+aq[P]
end


local P=ar+(as*ai.ColumnHeight)
ak.Size=UDim2.new(1,0,0,P)
end


local function PadText(al,am,an)
local ao=tostring(al)
if#ao>=am then
return ao:sub(1,am)
end

local ap=am-#ao
if an=="center"then
local aq=math.floor(ap/2)
local ar=ap-aq
return string.rep(" ",aq)..ao..string.rep(" ",ar)
elseif an=="right"then
return string.rep(" ",ap)..ao
else
return ao..string.rep(" ",ap)
end
end


local function FormatTextWithColumns(al)
if type(al)~="table"then
return tostring(al)
end

local am={}


if#al>0 then

for an,ao in ipairs(al)do
table.insert(am,tostring(ao))
end
else

for an,ao in pairs(al)do
table.insert(am,tostring(an)..": "..tostring(ao))
end
end

if#am==0 then
return"No data available"
end

local an=ai.ColumnCount or 2
local ao=ai.ColumnSpacing or 4
local ap=80


local aq={}
if ai.ColumnWidthMode=="equal"then
local ar=math.floor((ap-(ao*(an-1)))/an)
for as=1,an do
aq[as]=ar
end
elseif ai.ColumnWidthMode=="custom"and ai.ColumnWidths then
aq=ai.ColumnWidths
else

local ar=math.ceil(#am/an)
for as=1,an do
local at=0
for P=1,ar do
local Q=(as-1)*ar+P
if Q<=#am then
at=math.max(at,#am[Q])
end
end
aq[as]=math.max(at,10)
end
end


local ar={}
if ai.ColumnHeaders and#ai.ColumnHeaders>0 then
local as={}
for at=1,an do
local P=ai.ColumnHeaders[at]or("Column "..at)
table.insert(as,PadText(P,aq[at],ai.ColumnAlignment))
end
table.insert(ar,table.concat(as,string.rep(" ",ao)))


local at={}
for P=1,an do
table.insert(at,string.rep("-",aq[P]))
end
table.insert(ar,table.concat(at,string.rep("-",ao)))
end


local as=math.ceil(#am/an)
for at=1,as do
local P={}
for Q=1,an do
local R=(Q-1)*as+at
if R<=#am then
table.insert(P,PadText(am[R],aq[Q],ai.ColumnAlignment))
else
table.insert(P,string.rep(" ",aq[Q]))
end
end
table.insert(ar,table.concat(P,string.rep(" ",ao)))
end

return table.concat(ar,"\n")
end


local function SetInitialText()
if ai.UseUIColumns and type(ad.Text)=="table"then
aj.Visible=false
ak.Visible=true
CreateUIColumns(ad.Text)
elseif ai.UseColumns and type(ad.Text)=="table"then
aj.Visible=true
ak.Visible=false
aj.Text=FormatTextWithColumns(ad.Text)
else
aj.Visible=true
ak.Visible=false
aj.Text=tostring(ad.Text)
end
end


SetInitialText()

function ai.SetVisible(al,am:boolean)
ai.Visible=am

aj.Visible=ai.Visible
ak.Visible=ai.Visible and ai.UseUIColumns
ag:Resize()
end

function ai.SetText(al,am:string)
ai.Text=am


if ai.UseUIColumns and type(am)=="table"then
aj.Visible=false
ak.Visible=true
CreateUIColumns(am)

elseif ai.UseColumns and type(am)=="table"then
aj.Visible=true
ak.Visible=false
aj.Text=FormatTextWithColumns(am)
else
aj.Visible=true
ak.Visible=false
aj.Text=tostring(am)
end

if ai.DoesWrap then local
an, ao=
t:GetTextBounds(ai.Text,aj.FontFace,aj.TextSize,aj.AbsoluteSize.X)
aj.Size=UDim2.new(1,0,0,ao+4*t.DPIScale)
end

ag:Resize()
end


function ai.SetColumnCount(al,am)
ai.ColumnCount=am
if(ai.UseColumns or ai.UseUIColumns)and type(ai.Text)=="table"then
ai:SetText(ai.Text)
end
end

function ai.SetColumnSpacing(al,am)
ai.ColumnSpacing=am
if(ai.UseColumns or ai.UseUIColumns)and type(ai.Text)=="table"then
ai:SetText(ai.Text)
end
end

function ai.SetColumnHeaders(al,am)
ai.ColumnHeaders=am
if(ai.UseColumns or ai.UseUIColumns)and type(ai.Text)=="table"then
ai:SetText(ai.Text)
end
end

function ai.SetColumnWidthMode(al,am)
ai.ColumnWidthMode=am
if(ai.UseColumns or ai.UseUIColumns)and type(ai.Text)=="table"then
ai:SetText(ai.Text)
end
end

function ai.SetColumnAlignment(al,am)
ai.ColumnAlignment=am
if(ai.UseColumns or ai.UseUIColumns)and type(ai.Text)=="table"then
ai:SetText(ai.Text)
end
end

function ai.SetColumnSeparator(al,am)
ai.ColumnSeparator=am
if ai.UseColumns and type(ai.Text)=="table"then
ai:SetText(ai.Text)
end
end

function ai.SetColumnWidths(al,am)
ai.ColumnWidths=am
if(ai.UseColumns or ai.UseUIColumns)and type(ai.Text)=="table"then
ai:SetText(ai.Text)
end
end

function ai.SetUseColumns(al,am)
ai.UseColumns=am
if am then
ai.UseUIColumns=false
end
if type(ai.Text)=="table"then
ai:SetText(ai.Text)
end
end

function ai.SetUseUIColumns(al,am)
ai.UseUIColumns=am
if am then
ai.UseColumns=false
end
if type(ai.Text)=="table"then
ai:SetText(ai.Text)
end
end


function ai.SetColumnHeight(al,am)
ai.ColumnHeight=am
if ai.UseUIColumns and type(ai.Text)=="table"then
ai:SetText(ai.Text)
end
end

function ai.SetColumnPadding(al,am)
ai.ColumnPadding=am
if ai.UseUIColumns and type(ai.Text)=="table"then
ai:SetText(ai.Text)
end
end

function ai.SetColumnDividerColor(al,am)
ai.ColumnDividerColor=am
if ai.UseUIColumns and type(ai.Text)=="table"then
ai:SetText(ai.Text)
end
end

function ai.SetColumnDividerThickness(al,am)
ai.ColumnDividerThickness=am
if ai.UseUIColumns and type(ai.Text)=="table"then
ai:SetText(ai.Text)
end
end


function ai.SetupColumns(al,am)
if am.count then ai.ColumnCount=am.count end
if am.spacing then ai.ColumnSpacing=am.spacing end
if am.headers then ai.ColumnHeaders=am.headers end
if am.widthMode then ai.ColumnWidthMode=am.widthMode end
if am.alignment then ai.ColumnAlignment=am.alignment end
if am.separator then ai.ColumnSeparator=am.separator end
if am.widths then ai.ColumnWidths=am.widths end
if am.enabled~=nil then ai.UseColumns=am.enabled end
if am.uiEnabled~=nil then ai.UseUIColumns=am.uiEnabled end
if am.height then ai.ColumnHeight=am.height end
if am.padding then ai.ColumnPadding=am.padding end
if am.dividerColor then ai.ColumnDividerColor=am.dividerColor end
if am.dividerThickness then ai.ColumnDividerThickness=am.dividerThickness end

if type(ai.Text)=="table"then
ai:SetText(ai.Text)
end
end


function ai.GetColumnConfig(al)
return{
count=ai.ColumnCount,
spacing=ai.ColumnSpacing,
headers=ai.ColumnHeaders,
widthMode=ai.ColumnWidthMode,
alignment=ai.ColumnAlignment,
separator=ai.ColumnSeparator,
widths=ai.ColumnWidths,
enabled=ai.UseColumns,
uiEnabled=ai.UseUIColumns,
height=ai.ColumnHeight,
padding=ai.ColumnPadding,
dividerColor=ai.ColumnDividerColor,
dividerThickness=ai.ColumnDividerThickness
}
end

if ai.DoesWrap then local
al, am=
t:GetTextBounds(ai.Text,aj.FontFace,aj.TextSize,aj.AbsoluteSize.X)
aj.Size=UDim2.new(1,0,0,am+4*t.DPIScale)
else
New("UIListLayout",{
FillDirection=Enum.FillDirection.Horizontal,
HorizontalAlignment=Enum.HorizontalAlignment.Right,
Padding=UDim.new(0,6),
Parent=aj,
})
end

if ad.DoesWrap then
local al=aj.AbsoluteSize

aj:GetPropertyChangedSignal"AbsoluteSize":Connect(function()
if aj.AbsoluteSize==al then
return
end local

am, an=
t:GetTextBounds(ai.Text,aj.FontFace,aj.TextSize,aj.AbsoluteSize.X)
aj.Size=UDim2.new(1,0,0,an+4*t.DPIScale)

al=aj.AbsoluteSize
ag:Resize()
end)
end

ag:Resize()

ai.TextLabel=aj
ai.ColumnContainer=ak
ai.Container=ah
if not ad.DoesWrap then
setmetatable(ai,O)
end

ai.Holder=aj
table.insert(ag.Elements,ai)

if ad.Idx then
p[ad.Idx]=ai
else
table.insert(p,ai)
end

return ai
end

function ab.AddButton(ac,...)
local function GetInfo(...)
local ad={}

local ae=select(1,...)
local af=select(2,...)

if typeof(ae)=="table"or typeof(af)=="table"then
local ag=typeof(ae)=="table"and ae or af

ad.Text=ag.Text or""
ad.Func=ag.Func or function()end
ad.DoubleClick=ag.DoubleClick

ad.Tooltip=ag.Tooltip
ad.DisabledTooltip=ag.DisabledTooltip

ad.Risky=ag.Risky or false
ad.Disabled=ag.Disabled or false
ad.Visible=ag.Visible or true
ad.Idx=typeof(af)=="table"and ae or nil
else
ad.Text=ae or""
ad.Func=af or function()end
ad.DoubleClick=false

ad.Tooltip=nil
ad.DisabledTooltip=nil

ad.Risky=false
ad.Disabled=false
ad.Visible=true
ad.Idx=select(3,...)or nil
end

return ad
end
local ad=GetInfo(...)

local ae=ac
local af=ae.Container

local ag={
Text=ad.Text,
Func=ad.Func,
DoubleClick=ad.DoubleClick,

Tooltip=ad.Tooltip,
DisabledTooltip=ad.DisabledTooltip,
TooltipTable=nil,

Risky=ad.Risky,
Disabled=ad.Disabled,
Visible=ad.Visible,

Tween=nil,
Type="Button",
}

local ah=New("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,21),
Parent=af,
})

New("UIListLayout",{
FillDirection=Enum.FillDirection.Horizontal,
HorizontalFlex=Enum.UIFlexAlignment.Fill,
Padding=UDim.new(0,9),
Parent=ah,
})

local function CreateButton(ai)
local aj=New("TextButton",{
Active=not ai.Disabled,
BackgroundColor3=ai.Disabled and"BackgroundColor"or"MainColor",
Size=UDim2.fromScale(1,1),
Text=ai.Text,
TextSize=14,
TextTransparency=0.4,
Visible=ai.Visible,
Parent=ah,
})

local ak=New("UIStroke",{
Color="OutlineColor",
Transparency=ai.Disabled and 0.5 or 0,
Parent=aj,
})

return aj,ak
end

local function InitEvents(ai)
ai.Base.MouseEnter:Connect(function()
if ai.Disabled then
return
end

ai.Tween=i:Create(ai.Base,t.TweenInfo,{
TextTransparency=0,
})
ai.Tween:Play()
end)
ai.Base.MouseLeave:Connect(function()
if ai.Disabled then
return
end

ai.Tween=i:Create(ai.Base,t.TweenInfo,{
TextTransparency=0.4,
})
ai.Tween:Play()
end)

ai.Base.MouseButton1Click:Connect(function()
if ai.Disabled or ai.Locked then
return
end

if ai.DoubleClick then
ai.Locked=true

ai.Base.Text="Are you sure?"
ai.Base.TextColor3=t.Scheme.AccentColor
t.Registry[ai.Base].TextColor3="AccentColor"

local aj=WaitForEvent(ai.Base.MouseButton1Click,0.5)

ai.Base.Text=ai.Text
ai.Base.TextColor3=ai.Risky and t.Scheme.Red or t.Scheme.FontColor
t.Registry[ai.Base].TextColor3=ai.Risky and"Red"or"FontColor"

if aj then
t:SafeCallback(ai.Func)
end

d.RenderStepped:Wait()
ai.Locked=false
return
end

t:SafeCallback(ai.Func)
end)
end

ag.Base,ag.Stroke=CreateButton(ag)
InitEvents(ag)

function ag.AddButton(ai,...)
local aj=GetInfo(...)

local ak={
Text=aj.Text,
Func=aj.Func,
DoubleClick=aj.DoubleClick,

Tooltip=aj.Tooltip,
DisabledTooltip=aj.DisabledTooltip,
TooltipTable=nil,

Risky=aj.Risky,
Disabled=aj.Disabled,
Visible=aj.Visible,

Tween=nil,
Type="SubButton",
}

ag.SubButton=ak
ak.Base,ak.Stroke=CreateButton(ak)
InitEvents(ak)

function ak.UpdateColors(al)
if t.Unloaded then
return
end

StopTween(ak.Tween)

ak.Base.BackgroundColor3=ak.Disabled and t.Scheme.BackgroundColor
or t.Scheme.MainColor
ak.Base.TextTransparency=ak.Disabled and 0.8 or 0.4
ak.Stroke.Transparency=ak.Disabled and 0.5 or 0

t.Registry[ak.Base].BackgroundColor3=ak.Disabled and"BackgroundColor"
or"MainColor"
end

function ak.SetDisabled(al,am:boolean)
ak.Disabled=am

if ak.TooltipTable then
ak.TooltipTable.Disabled=ak.Disabled
end

ak.Base.Active=not ak.Disabled
ak:UpdateColors()
end

function ak.SetVisible(al,am:boolean)
ak.Visible=am

ak.Base.Visible=ak.Visible
ae:Resize()
end

function ak.SetText(al,am:string)
ak.Text=am
ak.Base.Text=am
end

if typeof(ak.Tooltip)=="string"or typeof(ak.DisabledTooltip)=="string"then
ak.TooltipTable=
t:AddTooltip(ak.Tooltip,ak.DisabledTooltip,ak.Base)
ak.TooltipTable.Disabled=ak.Disabled
end

if ak.Risky then
ak.Base.TextColor3=t.Scheme.Red
t.Registry[ak.Base].TextColor3="Red"
end

ak:UpdateColors()

if aj.Idx then
q[aj.Idx]=ak
else
table.insert(q,ak)
end

return ak
end

function ag.UpdateColors(ai)
if t.Unloaded then
return
end

StopTween(ag.Tween)

ag.Base.BackgroundColor3=ag.Disabled and t.Scheme.BackgroundColor
or t.Scheme.MainColor
ag.Base.TextTransparency=ag.Disabled and 0.8 or 0.4
ag.Stroke.Transparency=ag.Disabled and 0.5 or 0

t.Registry[ag.Base].BackgroundColor3=ag.Disabled and"BackgroundColor"or"MainColor"
end

function ag.SetDisabled(ai,aj:boolean)
ag.Disabled=aj

if ag.TooltipTable then
ag.TooltipTable.Disabled=ag.Disabled
end

ag.Base.Active=not ag.Disabled
ag:UpdateColors()
end

function ag.SetVisible(ai,aj:boolean)
ag.Visible=aj

ah.Visible=ag.Visible
ae:Resize()
end

function ag.SetText(ai,aj:string)
ag.Text=aj
ag.Base.Text=aj
end

if typeof(ag.Tooltip)=="string"or typeof(ag.DisabledTooltip)=="string"then
ag.TooltipTable=t:AddTooltip(ag.Tooltip,ag.DisabledTooltip,ag.Base)
ag.TooltipTable.Disabled=ag.Disabled
end

if ag.Risky then
ag.Base.TextColor3=t.Scheme.Red
t.Registry[ag.Base].TextColor3="Red"
end

ag:UpdateColors()
ae:Resize()

ag.Holder=ah
table.insert(ae.Elements,ag)

if ad.Idx then
q[ad.Idx]=ag
else
table.insert(q,ag)
end

return ag
end

function ab.AddCheckbox(ac,ad,ae)
ae=t:Validate(ae,v.Toggle)

local af=ac
local ag=af.Container

local ah={
Text=ae.Text,
Value=ae.Default,

Tooltip=ae.Tooltip,
DisabledTooltip=ae.DisabledTooltip,
TooltipTable=nil,

Callback=ae.Callback,
Changed=ae.Changed,

Risky=ae.Risky,
Disabled=ae.Disabled,
Visible=ae.Visible,
Addons={},

Type="Toggle",
}

local ai=New("TextButton",{
Active=not ah.Disabled,
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,18),
Text="",
Visible=ah.Visible,
Parent=ag,
})

local aj=New("TextLabel",{
BackgroundTransparency=1,
Position=UDim2.fromOffset(26,0),
Size=UDim2.new(1,-26,1,0),
Text=ah.Text,
TextSize=14,
TextTransparency=0.4,
TextXAlignment=Enum.TextXAlignment.Left,
Parent=ai,
})

New("UIListLayout",{
FillDirection=Enum.FillDirection.Horizontal,
HorizontalAlignment=Enum.HorizontalAlignment.Right,
Padding=UDim.new(0,6),
Parent=aj,
})

local ak=New("Frame",{
BackgroundColor3="MainColor",
Size=UDim2.fromScale(1,1),
SizeConstraint=Enum.SizeConstraint.RelativeYY,
Parent=ai,
})
New("UICorner",{
CornerRadius=UDim.new(0,t.CornerRadius/2),
Parent=ak,
})

local al=New("UIStroke",{
Color="OutlineColor",
Parent=ak,
})

local am=New("ImageLabel",{
Image=K and K.Url or"",
ImageColor3="FontColor",
ImageRectOffset=K and K.ImageRectOffset or Vector2.zero,
ImageRectSize=K and K.ImageRectSize or Vector2.zero,
ImageTransparency=1,
Position=UDim2.fromOffset(2,2),
Size=UDim2.new(1,-4,1,-4),
Parent=ak,
})

function ah.UpdateColors(an)
ah:Display()
end

function ah.Display(an)
if t.Unloaded then
return
end

al.Transparency=ah.Disabled and 0.5 or 0

if ah.Disabled then
aj.TextTransparency=0.8
am.ImageTransparency=ah.Value and 0.8 or 1

ak.BackgroundColor3=t.Scheme.BackgroundColor
t.Registry[ak].BackgroundColor3="BackgroundColor"

return
end

i:Create(aj,t.TweenInfo,{
TextTransparency=ah.Value and 0 or 0.4,
}):Play()
i:Create(am,t.TweenInfo,{
ImageTransparency=ah.Value and 0 or 1,
}):Play()

ak.BackgroundColor3=t.Scheme.MainColor
t.Registry[ak].BackgroundColor3="MainColor"
end

function ah.OnChanged(an,ao)
ah.Changed=ao
end

function ah.SetValue(an,ao)
if ah.Disabled then
return
end

ah.Value=ao
ah:Display()

for ap,aq in pairs(ah.Addons)do
if aq.Type=="KeyPicker"and aq.SyncToggleState then
aq.Toggled=ah.Value
aq:Update()
end
end

t:SafeCallback(ah.Callback,ah.Value)
t:SafeCallback(ah.Changed,ah.Value)
t:UpdateDependencyBoxes()
end

function ah.SetDisabled(an,ao:boolean)
ah.Disabled=ao

if ah.TooltipTable then
ah.TooltipTable.Disabled=ah.Disabled
end

for ap,aq in pairs(ah.Addons)do
if aq.Type=="KeyPicker"and aq.SyncToggleState then
aq:Update()
end
end

ai.Active=not ah.Disabled
ah:Display()
end

function ah.SetVisible(an,ao:boolean)
ah.Visible=ao

ai.Visible=ah.Visible
af:Resize()
end

function ah.SetText(an,ao:string)
ah.Text=ao
aj.Text=ao
end

ai.MouseButton1Click:Connect(function()
if ah.Disabled then
return
end

ah:SetValue(not ah.Value)
end)

if typeof(ah.Tooltip)=="string"or typeof(ah.DisabledTooltip)=="string"then
ah.TooltipTable=t:AddTooltip(ah.Tooltip,ah.DisabledTooltip,ai)
ah.TooltipTable.Disabled=ah.Disabled
end

if ah.Risky then
aj.TextColor3=t.Scheme.Red
t.Registry[aj].TextColor3="Red"
end

ah:Display()
af:Resize()

ah.TextLabel=aj
ah.Container=ag
setmetatable(ah,O)

ah.Holder=ai
table.insert(af.Elements,ah)

r[ad]=ah

return ah
end

function ab.AddToggle(ac,ad,ae)
if t.ForceCheckbox then
return ab.AddCheckbox(ac,ad,ae)
end

ae=t:Validate(ae,v.Toggle)

local af=ac
local ag=af.Container

local ah={
Text=ae.Text,
Value=ae.Default,

Tooltip=ae.Tooltip,
DisabledTooltip=ae.DisabledTooltip,
TooltipTable=nil,

Callback=ae.Callback,
Changed=ae.Changed,

Risky=ae.Risky,
Disabled=ae.Disabled,
Visible=ae.Visible,
Addons={},

Type="Toggle",
}

local ai=New("TextButton",{
Active=not ah.Disabled,
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,18),
Text="",
Visible=ah.Visible,
Parent=ag,
})

local aj=New("TextLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,-40,1,0),
Text=ah.Text,
TextSize=14,
TextTransparency=0.4,
TextXAlignment=Enum.TextXAlignment.Left,
Parent=ai,
})

New("UIListLayout",{
FillDirection=Enum.FillDirection.Horizontal,
HorizontalAlignment=Enum.HorizontalAlignment.Right,
Padding=UDim.new(0,6),
Parent=aj,
})

local ak=New("Frame",{
AnchorPoint=Vector2.new(1,0),
BackgroundColor3="MainColor",
Position=UDim2.fromScale(1,0),
Size=UDim2.fromOffset(32,18),
Parent=ai,
})
New("UICorner",{
CornerRadius=UDim.new(1,0),
Parent=ak,
})
New("UIPadding",{
PaddingBottom=UDim.new(0,2),
PaddingLeft=UDim.new(0,2),
PaddingRight=UDim.new(0,2),
PaddingTop=UDim.new(0,2),
Parent=ak,
})
local al=New("UIStroke",{
Color="OutlineColor",
Parent=ak,
})

local am=New("Frame",{
BackgroundColor3="FontColor",
Size=UDim2.fromScale(1,1),
SizeConstraint=Enum.SizeConstraint.RelativeYY,
Parent=ak,
})
New("UICorner",{
CornerRadius=UDim.new(1,0),
Parent=am,
})

function ah.UpdateColors(an)
ah:Display()
end

function ah.Display(an)
if t.Unloaded then
return
end

local ao=ah.Value and 1 or 0

ak.BackgroundTransparency=ah.Disabled and 0.75 or 0
al.Transparency=ah.Disabled and 0.75 or 0

ak.BackgroundColor3=ah.Value and t.Scheme.AccentColor or t.Scheme.MainColor
al.Color=ah.Value and t.Scheme.AccentColor or t.Scheme.OutlineColor

t.Registry[ak].BackgroundColor3=ah.Value and"AccentColor"or"MainColor"
t.Registry[al].Color=ah.Value and"AccentColor"or"OutlineColor"

if ah.Disabled then
aj.TextTransparency=0.8
am.AnchorPoint=Vector2.new(ao,0)
am.Position=UDim2.fromScale(ao,0)

am.BackgroundColor3=t:GetDarkerColor(t.Scheme.FontColor)
t.Registry[am].BackgroundColor3=function()
return t:GetDarkerColor(t.Scheme.FontColor)
end

return
end

i:Create(aj,t.TweenInfo,{
TextTransparency=ah.Value and 0 or 0.4,
}):Play()
i:Create(am,t.TweenInfo,{
AnchorPoint=Vector2.new(ao,0),
Position=UDim2.fromScale(ao,0),
}):Play()

am.BackgroundColor3=t.Scheme.FontColor
t.Registry[am].BackgroundColor3="FontColor"
end

function ah.OnChanged(an,ao)
ah.Changed=ao
end

function ah.SetValue(an,ao)
if ah.Disabled then
return
end

ah.Value=ao
ah:Display()

for ap,aq in pairs(ah.Addons)do
if aq.Type=="KeyPicker"and aq.SyncToggleState then
aq.Toggled=ah.Value
aq:Update()
end
end

t:SafeCallback(ah.Callback,ah.Value)
t:SafeCallback(ah.Changed,ah.Value)
t:UpdateDependencyBoxes()
end

function ah.SetDisabled(an,ao:boolean)
ah.Disabled=ao

if ah.TooltipTable then
ah.TooltipTable.Disabled=ah.Disabled
end

for ap,aq in pairs(ah.Addons)do
if aq.Type=="KeyPicker"and aq.SyncToggleState then
aq:Update()
end
end

ai.Active=not ah.Disabled
ah:Display()
end

function ah.SetVisible(an,ao:boolean)
ah.Visible=ao

ai.Visible=ah.Visible
af:Resize()
end

function ah.SetText(an,ao:string)
ah.Text=ao
aj.Text=ao
end

ai.MouseButton1Click:Connect(function()
if ah.Disabled then
return
end

ah:SetValue(not ah.Value)
end)

if typeof(ah.Tooltip)=="string"or typeof(ah.DisabledTooltip)=="string"then
ah.TooltipTable=t:AddTooltip(ah.Tooltip,ah.DisabledTooltip,ai)
ah.TooltipTable.Disabled=ah.Disabled
end

if ah.Risky then
aj.TextColor3=t.Scheme.Red
t.Registry[aj].TextColor3="Red"
end

ah:Display()
af:Resize()

ah.TextLabel=aj
ah.Container=ag
setmetatable(ah,O)

ah.Holder=ai
table.insert(af.Elements,ah)

r[ad]=ah

return ah
end

function ab.AddInput(ac,ad,ae)
ae=t:Validate(ae,v.Input)

local af=ac
local ag=af.Container

local ah={
Text=ae.Text,
Value=ae.Default,
Finished=ae.Finished,
Numeric=ae.Numeric,
ClearTextOnFocus=ae.ClearTextOnFocus,
Placeholder=ae.Placeholder,
AllowEmpty=ae.AllowEmpty,
EmptyReset=ae.EmptyReset,

Tooltip=ae.Tooltip,
DisabledTooltip=ae.DisabledTooltip,
TooltipTable=nil,

Callback=ae.Callback,
Changed=ae.Changed,

Disabled=ae.Disabled,
Visible=ae.Visible,

Type="Input",
}

local ai=New("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,39),
Visible=ah.Visible,
Parent=ag,
})

local aj=New("TextLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,14),
Text=ah.Text,
TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,
Parent=ai,
})

local ak=New("TextBox",{
AnchorPoint=Vector2.new(0,1),
BackgroundColor3="MainColor",
BorderColor3="OutlineColor",
BorderSizePixel=1,
ClearTextOnFocus=not ah.Disabled and ah.ClearTextOnFocus,
PlaceholderText=ah.Placeholder,
Position=UDim2.fromScale(0,1),
Size=UDim2.new(1,0,0,21),
Text=ah.Value,
TextEditable=not ah.Disabled,
TextScaled=true,
TextXAlignment=Enum.TextXAlignment.Left,
Parent=ai,
})

New("UIPadding",{
PaddingBottom=UDim.new(0,3),
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
PaddingTop=UDim.new(0,4),
Parent=ak,
})

function ah.UpdateColors(al)
if t.Unloaded then
return
end

aj.TextTransparency=ah.Disabled and 0.8 or 0
ak.TextTransparency=ah.Disabled and 0.8 or 0
end

function ah.OnChanged(al,am)
ah.Changed=am
end

function ah.SetValue(al,am)
if not ah.AllowEmpty and Trim(am)==""then
am=ah.EmptyReset
end

if ae.MaxLength and#am>ae.MaxLength then
am=am:sub(1,ae.MaxLength)
end

if ah.Numeric then
if#am>0 and not tonumber(am)then
am=ah.Value
end
end

ah.Value=am
ak.Text=am

if not ah.Disabled then
t:SafeCallback(ah.Callback,ah.Value)
t:SafeCallback(ah.Changed,ah.Value)
end
end

function ah.SetDisabled(al,am:boolean)
ah.Disabled=am

if ah.TooltipTable then
ah.TooltipTable.Disabled=ah.Disabled
end

ak.ClearTextOnFocus=not ah.Disabled and ah.ClearTextOnFocus
ak.TextEditable=not ah.Disabled
ah:UpdateColors()
end

function ah.SetVisible(al,am:boolean)
ah.Visible=am

ai.Visible=ah.Visible
af:Resize()
end

function ah.SetText(al,am:string)
ah.Text=am
aj.Text=am
end

if ah.Finished then
ak.FocusLost:Connect(function(al)
if not al then
return
end

ah:SetValue(ak.Text)
end)
else
ak:GetPropertyChangedSignal"Text":Connect(function()
ah:SetValue(ak.Text)
end)
end

if typeof(ah.Tooltip)=="string"or typeof(ah.DisabledTooltip)=="string"then
ah.TooltipTable=t:AddTooltip(ah.Tooltip,ah.DisabledTooltip,ak)
ah.TooltipTable.Disabled=ah.Disabled
end

af:Resize()

ah.Holder=ai
table.insert(af.Elements,ah)

s[ad]=ah

return ah
end

function ab.AddSlider(ac,ad,ae)
ae=t:Validate(ae,v.Slider)

local af=ac
local ag=af.Container


local ah={
Text=ae.Text,
Value=ae.Default,
Min=ae.Min,
Max=ae.Max,

Prefix=ae.Prefix,
Suffix=ae.Suffix,

Tooltip=ae.Tooltip,
DisabledTooltip=ae.DisabledTooltip,
TooltipTable=nil,

Callback=ae.Callback,
Changed=ae.Changed,

Disabled=ae.Disabled,
Visible=ae.Visible,

Type="Slider",
}

local ai=New("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,ae.Compact and 13 or 31),
Visible=ah.Visible,
Parent=ag,
})

local aj
if not ae.Compact then
aj=New("TextLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,14),
Text=ah.Text,
TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,
Parent=ai,
})
end

local ak=New("TextButton",{
Active=not ah.Disabled,
AnchorPoint=Vector2.new(0,1),
BackgroundColor3="MainColor",
BorderColor3="OutlineColor",
BorderSizePixel=1,
Position=UDim2.fromScale(0,1),
Size=UDim2.new(1,0,0,13),
Text="",
Parent=ai,
})

local al=New("TextLabel",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
Text="",
TextSize=14,
ZIndex=2,
Parent=ak,
})
New("UIStroke",{
ApplyStrokeMode=Enum.ApplyStrokeMode.Contextual,
Color="Dark",
LineJoinMode=Enum.LineJoinMode.Miter,
Parent=al,
})

local am=New("Frame",{
BackgroundColor3="AccentColor",
Size=UDim2.fromScale(0.5,1),
Parent=ak,

DPIExclude={
Size=true,
},
})

function ah.UpdateColors(an)
if t.Unloaded then
return
end

if aj then
aj.TextTransparency=ah.Disabled and 0.8 or 0
end
al.TextTransparency=ah.Disabled and 0.8 or 0

am.BackgroundColor3=ah.Disabled and t.Scheme.OutlineColor or t.Scheme.AccentColor
t.Registry[am].BackgroundColor3=ah.Disabled and"OutlineColor"or"AccentColor"
end

function ah.Display(an)
if t.Unloaded then
return
end

if ae.Compact then
al.Text=string.format("%s: %s%s%s",ah.Text,ah.Prefix,ah.Value,ah.Suffix)
elseif ae.HideMax then
al.Text=string.format("%s%s%s",ah.Prefix,ah.Value,ah.Suffix)
else
al.Text=string.format(
"%s%s%s/%s%s%s",
ah.Prefix,
ah.Value,
ah.Suffix,
ah.Prefix,
ah.Max,
ah.Suffix
)
end

local ao=(ah.Value-ah.Min)/(ah.Max-ah.Min)
am.Size=UDim2.fromScale(ao,1)
end

function ah.OnChanged(an,ao)
ah.Changed=ao
end

function ah.SetMax(an,ao)
assert(ao>ah.Min,"Max value cannot be less than the current min value.")

ah.Value=math.clamp(ah.Value,ah.Min,ao)
ah.Max=ao
ah:Display()
end

function ah.SetMin(an,ao)
assert(ao<ah.Max,"Min value cannot be greater than the current max value.")

ah.Value=math.clamp(ah.Value,ao,ah.Max)
ah.Min=ao
ah:Display()
end

function ah.SetValue(an,ao)
if ah.Disabled then
return
end

local ap=tonumber(ao)
if not ap then
return
end

ap=math.clamp(ap,ah.Min,ah.Max)

ah.Value=ap
ah:Display()

t:SafeCallback(ah.Callback,ah.Value)
t:SafeCallback(ah.Changed,ah.Value)
end

function ah.SetDisabled(an,ao:boolean)
ah.Disabled=ao

if ah.TooltipTable then
ah.TooltipTable.Disabled=ah.Disabled
end

ak.Active=not ah.Disabled
ah:UpdateColors()
end

function ah.SetVisible(an,ao:boolean)
ah.Visible=ao

ai.Visible=ah.Visible
af:Resize()
end

function ah.SetText(an,ao:string)
ah.Text=ao
if aj then
aj.Text=ao
return
end
ah:Display()
end

function ah.SetPrefix(an,ao:string)
ah.Prefix=ao
ah:Display()
end

function ah.SetSuffix(an,ao:string)
ah.Suffix=ao
ah:Display()
end

ak.InputBegan:Connect(function(an:InputObject)
if not IsClickInput(an)or ah.Disabled then
return
end

for ao,ap in pairs(t.ActiveTab.Sides)do
ap.ScrollingEnabled=false
end

while IsClickInput(an)do
local ao=o.X
local ap=math.clamp((ao-ak.AbsolutePosition.X)/ak.AbsoluteSize.X,0,1)

local aq=ah.Value
ah.Value=Round(ah.Min+((ah.Max-ah.Min)*ap),ae.Rounding)

ah:Display()
if ah.Value~=aq then
t:SafeCallback(ah.Callback,ah.Value)
t:SafeCallback(ah.Changed,ah.Value)
end

d.RenderStepped:Wait()
end

for ao,ap in pairs(t.ActiveTab.Sides)do
ap.ScrollingEnabled=true
end
end)

if typeof(ah.Tooltip)=="string"or typeof(ah.DisabledTooltip)=="string"then
ah.TooltipTable=t:AddTooltip(ah.Tooltip,ah.DisabledTooltip,ak)
ah.TooltipTable.Disabled=ah.Disabled
end

ah:UpdateColors()
ah:Display()
af:Resize()

ah.Holder=ai
table.insert(af.Elements,ah)

s[ad]=ah

return ah
end

function ab.AddDropdown(ac,ad,ae)
ae=t:Validate(ae,v.Dropdown)

local af=ac
local ag=af.Container

if ae.SpecialType=="Player"then
ae.Values=GetPlayers(ae.ExcludeLocalPlayer)
ae.AllowNull=true
elseif ae.SpecialType=="Team"then
ae.Values=GetTeams()
ae.AllowNull=true
end
local ah={
Text=typeof(ae.Text)=="string"and ae.Text or nil,
Value=ae.Multi and{}or nil,
Values=ae.Values,
DisabledValues=ae.DisabledValues,

SpecialType=ae.SpecialType,
ExcludeLocalPlayer=ae.ExcludeLocalPlayer,

Tooltip=ae.Tooltip,
DisabledTooltip=ae.DisabledTooltip,
TooltipTable=nil,

Callback=ae.Callback,
Changed=ae.Changed,

Disabled=ae.Disabled,
Visible=ae.Visible,

Type="Dropdown",
}

local ai=New("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,ah.Text and 39 or 21),
Visible=ah.Visible,
Parent=ag,
})

local aj=New("TextLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,14),
Text=ah.Text,
TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,
Visible=not not ae.Text,
Parent=ai,
})

local ak=New("TextButton",{
Active=not ah.Disabled,
AnchorPoint=Vector2.new(0,1),
BackgroundColor3="MainColor",
BorderColor3="OutlineColor",
BorderSizePixel=1,
Position=UDim2.fromScale(0,1),
Size=UDim2.new(1,0,0,21),
Text="---",
TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,
Parent=ai,
})

New("UIPadding",{
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,4),
Parent=ak,
})

local al=New("ImageLabel",{
AnchorPoint=Vector2.new(1,0.5),
Image=L and L.Url or"",
ImageColor3="FontColor",
ImageRectOffset=L and L.ImageRectOffset or Vector2.zero,
ImageRectSize=L and L.ImageRectSize or Vector2.zero,
ImageTransparency=0.5,
Position=UDim2.fromScale(1,0.5),
Size=UDim2.fromOffset(16,16),
Parent=ak,
})

local am
if ae.Searchable then
am=New("TextBox",{
BackgroundTransparency=1,
PlaceholderText="Search...",
Position=UDim2.fromOffset(-8,0),
Size=UDim2.new(1,-12,1,0),
TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,
Visible=false,
Parent=ak,
})
New("UIPadding",{
PaddingLeft=UDim.new(0,8),
Parent=am,
})
end

local an=t:AddContextMenu(
ak,
function()
return UDim2.fromOffset(ak.AbsoluteSize.X,0)
end,
function()
return{0.5,ak.AbsoluteSize.Y+1.5}
end,
2,
function(an:boolean)
ak.TextTransparency=(an and am)and 1 or 0
al.ImageTransparency=an and 0 or 0.5
al.Rotation=an and 180 or 0
if am then
am.Text=""
am.Visible=an
end
end
)
ah.Menu=an
t:UpdateDPI(an.Menu,{
Position=false,
Size=false,
})

function ah.RecalculateListSize(ao,ap)
local aq=math.clamp(
(ap or GetTableSize(ah.Values))*(21*t.DPIScale),
0,
ae.MaxVisibleDropdownItems*(21*t.DPIScale)
)

an:SetSize(function()
return UDim2.fromOffset(ak.AbsoluteSize.X,aq)
end)
end

function ah.UpdateColors(ao)
if t.Unloaded then
return
end

aj.TextTransparency=ah.Disabled and 0.8 or 0
ak.TextTransparency=ah.Disabled and 0.8 or 0
al.ImageTransparency=ah.Disabled and 0.8 or an.Active and 0 or 0.5
end

function ah.Display(ao)
if t.Unloaded then
return
end

local ap=""

if ae.Multi then
for aq,ar in pairs(ah.Values)do
if ah.Value[ar]then
ap=ap
..(ae.FormatDisplayValue and tostring(ae.FormatDisplayValue(ar))or tostring(ar))
..", "
end
end

ap=ap:sub(1,#ap-2)
else
ap=ah.Value and tostring(ah.Value)or""
if ap~=""and ae.FormatDisplayValue then
ap=tostring(ae.FormatDisplayValue(ap))
end
end

if#ap>25 then
ap=ap:sub(1,22).."..."
end

ak.Text=(ap==""and"---"or ap)
end

function ah.OnChanged(ao,ap)
ah.Changed=ap
end

function ah.GetActiveValues(ao)
if ae.Multi then
local ap={}

for aq,ar in pairs(ah.Value)do
table.insert(ap,aq)
end

return ap
end

return ah.Value and 1 or 0
end

local ao={}
function ah.BuildDropdownList(ap)
local aq=ah.Values
local ar=ah.DisabledValues

for as,at in pairs(ao)do
as:Destroy()
end
table.clear(ao)

local as=0
for at,P in pairs(aq)do
if am and not tostring(P):lower():match(am.Text:lower())then
continue
end

as+=1
local Q=table.find(ar,P)
local R={}

local S=New("TextButton",{
BackgroundColor3="MainColor",
BackgroundTransparency=1,
LayoutOrder=Q and 1 or 0,
Size=UDim2.new(1,0,0,21),
Text=tostring(P),
TextSize=14,
TextTransparency=0.5,
TextXAlignment=Enum.TextXAlignment.Left,
Parent=an.Menu,
})
New("UIPadding",{
PaddingLeft=UDim.new(0,7),
PaddingRight=UDim.new(0,7),
Parent=S,
})

local T
if ae.Multi then
T=ah.Value[P]
else
T=ah.Value==P
end

function R.UpdateButton(U)
if ae.Multi then
T=ah.Value[P]
else
T=ah.Value==P
end

S.BackgroundTransparency=T and 0 or 1
S.TextTransparency=Q and 0.8 or T and 0 or 0.5
end

if not Q then
S.MouseButton1Click:Connect(function()
local U=not T

if not(ah:GetActiveValues()==1 and not U and not ae.AllowNull)then
T=U
if ae.Multi then
ah.Value[P]=T and true or nil
else
ah.Value=T and P or nil
end

for V,W in pairs(ao)do
W:UpdateButton()
end
end

R:UpdateButton()
ah:Display()

t:SafeCallback(ah.Callback,ah.Value)
t:SafeCallback(ah.Changed,ah.Value)
t:UpdateDependencyBoxes()
end)
end

R:UpdateButton()
ah:Display()

ao[S]=R
end

ah:RecalculateListSize(as)
end

function ah.SetValue(ap,aq)
if ae.Multi then
local ar={}

for as,at in pairs(aq or{})do
if at and table.find(ah.Values,as)then
ar[as]=true
end
end

ah.Value=ar
else
if table.find(ah.Values,aq)then
ah.Value=aq
elseif not aq then
ah.Value=nil
end
end

ah:Display()
for ar,as in pairs(ao)do
as:UpdateButton()
end

if not ah.Disabled then
t:SafeCallback(ah.Callback,ah.Value)
t:SafeCallback(ah.Changed,ah.Value)
t:UpdateDependencyBoxes()
end
end

function ah.SetValues(ap,aq)
ah.Values=aq
ah:BuildDropdownList()
end

function ah.AddValues(ap,aq)
if typeof(aq)=="table"then
for ar,as in pairs(aq)do
table.insert(ah.Values,as)
end
elseif typeof(aq)=="string"then
table.insert(ah.Values,aq)
else
return
end

ah:BuildDropdownList()
end

function ah.SetDisabledValues(ap,aq)
ah.DisabledValues=aq
ah:BuildDropdownList()
end

function ah.AddDisabledValues(ap,aq)
if typeof(aq)=="table"then
for ar,as in pairs(aq)do
table.insert(ah.DisabledValues,as)
end
elseif typeof(aq)=="string"then
table.insert(ah.DisabledValues,aq)
else
return
end

ah:BuildDropdownList()
end

function ah.SetDisabled(ap,aq:boolean)
ah.Disabled=aq

if ah.TooltipTable then
ah.TooltipTable.Disabled=ah.Disabled
end

an:Close()
ak.Active=not ah.Disabled
ah:UpdateColors()
end

function ah.SetVisible(ap,aq:boolean)
ah.Visible=aq

ai.Visible=ah.Visible
af:Resize()
end

function ah.SetText(ap,aq:string)
ah.Text=aq
ai.Size=UDim2.new(1,0,0,(aq and 39 or 21)*t.DPIScale)

aj.Text=aq and aq or""
aj.Visible=not not aq
end

ak.MouseButton1Click:Connect(function()
if ah.Disabled then
return
end

an:Toggle()
end)

if am then
am:GetPropertyChangedSignal"Text":Connect(ah.BuildDropdownList)
end

local ap={}
if typeof(ae.Default)=="string"then
local aq=table.find(ah.Values,ae.Default)
if aq then
table.insert(ap,aq)
end
elseif typeof(ae.Default)=="table"then
for aq,ar in next,ae.Default do
local as=table.find(ah.Values,ar)
if as then
table.insert(ap,as)
end
end
elseif ah.Values[ae.Default]~=nil then
table.insert(ap,ae.Default)
end
if next(ap)then
for aq=1,#ap do
local ar=ap[aq]
if ae.Multi then
ah.Value[ah.Values[ar] ]=true
else
ah.Value=ah.Values[ar]
end

if not ae.Multi then
break
end
end
end

if typeof(ah.Tooltip)=="string"or typeof(ah.DisabledTooltip)=="string"then
ah.TooltipTable=t:AddTooltip(ah.Tooltip,ah.DisabledTooltip,ak)
ah.TooltipTable.Disabled=ah.Disabled
end

ah:UpdateColors()
ah:Display()
ah:BuildDropdownList()
af:Resize()

ah.Holder=ai
table.insert(af.Elements,ah)

s[ad]=ah

return ah
end

function ab.AddViewport(ac,ad,ae)
ae=t:Validate(ae,v.Viewport)

local af=ac
local ag=af.Container

local ah,ai=false,false
local aj,ak=0

local al={
Object=if ae.Clone then ae.Object:Clone()else ae.Object,
Camera=if not ae.Camera then Instance.new"Camera"else ae.Camera,
Interactive=ae.Interactive,
AutoFocus=ae.AutoFocus,
Visible=ae.Visible,
Type="Viewport",
}

assert(
typeof(al.Object)=="Instance"and(al.Object:IsA"BasePart"or al.Object:IsA"Model"),
"Instance must be a BasePart or Model."
)

assert(
typeof(al.Camera)=="Instance"and al.Camera:IsA"Camera",
"Camera must be a valid Camera instance."
)

local function GetModelSize(am)
if am:IsA"BasePart"then
return am.Size
end

return select(2,am:GetBoundingBox())
end

local function FocusCamera()
local am=GetModelSize(al.Object)
local an=math.max(am.X,am.Y,am.Z)
local ao=an*2
local ap=al.Object:GetPivot().Position

al.Camera.CFrame=
CFrame.new(ap+Vector3.new(0,an/2,ao),ap)
end

local am=New("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,ae.Height),
Visible=al.Visible,
Parent=ag,
})

local an=New("Frame",{
AnchorPoint=Vector2.new(0,1),
BackgroundColor3="MainColor",
BorderColor3="OutlineColor",
BorderSizePixel=1,
Position=UDim2.fromScale(0,1),
Size=UDim2.fromScale(1,1),
Parent=am,
})

New("UIPadding",{
PaddingBottom=UDim.new(0,3),
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
PaddingTop=UDim.new(0,4),
Parent=an,
})

local ao=New("ViewportFrame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
Parent=an,
CurrentCamera=al.Camera,
Active=al.Interactive,
})

ao.MouseEnter:Connect(function()
if not al.Interactive then
return
end

for ap,aq in pairs(af.Tab.Sides)do
aq.ScrollingEnabled=false
end
end)

ao.MouseLeave:Connect(function()
if not al.Interactive then
return
end

for ap,aq in pairs(af.Tab.Sides)do
aq.ScrollingEnabled=true
end
end)

ao.InputBegan:Connect(function(ap)
if not al.Interactive then
return
end

if ap.UserInputType==Enum.UserInputType.MouseButton2 then
ah=true
ak=ap.Position
elseif ap.UserInputType==Enum.UserInputType.Touch and not ai then
ah=true
ak=ap.Position
end
end)

t:GiveSignal(f.InputEnded:Connect(function(ap)
if not al.Interactive then
return
end

if ap.UserInputType==Enum.UserInputType.MouseButton2 then
ah=false
elseif ap.UserInputType==Enum.UserInputType.Touch then
ah=false
end
end))

t:GiveSignal(f.InputChanged:Connect(function(ap)
if not al.Interactive or not ah or ai then
return
end

if
ap.UserInputType==Enum.UserInputType.MouseMovement
or ap.UserInputType==Enum.UserInputType.Touch
then
local aq=ap.Position-ak
ak=ap.Position

local ar=al.Object:GetPivot().Position
local as=al.Camera

local at=CFrame.fromAxisAngle(Vector3.new(0,1,0),-aq.X*0.01)
as.CFrame=CFrame.new(ar)*at*CFrame.new(-ar)*as.CFrame

local P=CFrame.fromAxisAngle(as.CFrame.RightVector,-aq.Y*0.01)
local Q=CFrame.new(ar)*P*CFrame.new(-ar)*as.CFrame

if Q.UpVector.Y>0.1 then
as.CFrame=Q
end
end
end))

ao.InputChanged:Connect(function(ap)
if not al.Interactive then
return
end

if ap.UserInputType==Enum.UserInputType.MouseWheel then
local aq=ap.Position.Z*2
al.Camera.CFrame+=al.Camera.CFrame.LookVector*aq
end
end)

t:GiveSignal(f.TouchPinch:Connect(function(ap,aq,ar,as)
if not al.Interactive or not t:MouseIsOverFrame(ao,ap[1])then
return
end

if as==Enum.UserInputState.Begin then
ai=true
ah=false
aj=(ap[1]-ap[2]).Magnitude
elseif as==Enum.UserInputState.Change then
local at=(ap[1]-ap[2]).Magnitude
local P=(at-aj)*0.1
aj=at
al.Camera.CFrame+=al.Camera.CFrame.LookVector*P
elseif as==Enum.UserInputState.End or as==Enum.UserInputState.Cancel then
ai=false
end
end))

al.Object.Parent=ao
if al.AutoFocus then
FocusCamera()
end

function al.SetObject(ap,aq:Instance,ar:boolean?)
assert(aq,"Object cannot be nil.")

if ar then
aq=aq:Clone()
end

if al.Object then
al.Object:Destroy()
end

al.Object=aq
al.Object.Parent=ao

af:Resize()
end

function al.SetHeight(ap,aq:number)
assert(aq>0,"Height must be greater than 0.")

am.Size=UDim2.new(1,0,0,aq)
af:Resize()
end

function al.Focus(ap)
if not al.Object then
return
end

FocusCamera()
end

function al.SetCamera(ap,aq:Instance)
assert(
aq and typeof(aq)=="Instance"and aq:IsA"Camera",
"Camera must be a valid Camera instance."
)

al.Camera=aq
ao.CurrentCamera=aq
end

function al.SetInteractive(ap,aq:boolean)
al.Interactive=aq
ao.Active=aq
end

function al.SetVisible(ap,aq:boolean)
al.Visible=aq

am.Visible=al.Visible
af:Resize()
end

af:Resize()

al.Holder=am
table.insert(af.Elements,al)

s[ad]=al

return al
end

function ab.AddPreview(ac,ad,ae)
ae=t:Validate(ae,v.Preview)

local af=ac
local ag=af.Container

local ah={
Text=ae.Text,
Object=if ae.Clone then(ae.Object and ae.Object:Clone())else ae.Object,
Camera=if not ae.Camera then Instance.new"Camera"else ae.Camera,
Interactive=ae.Interactive,
AutoFocus=ae.AutoFocus,
AutoRotate=ae.AutoRotate,
RotationSpeed=ae.RotationSpeed,
CameraDistance=ae.CameraDistance,
CameraAngle=ae.CameraAngle,
SizeMode=ae.SizeMode,
MinHeight=ae.MinHeight,
MaxHeight=ae.MaxHeight,
AspectRatio=ae.AspectRatio,
ScaleFactor=ae.ScaleFactor,
BackgroundColor=ae.BackgroundColor,
FocusIndicator=ae.FocusIndicator,
Visible=ae.Visible,
Type="Preview",
Callback=ae.Callback,
IsFocused=false,
}

if ah.Object then
assert(
typeof(ah.Object)=="Instance"and(ah.Object:IsA"BasePart"or ah.Object:IsA"Model"),
"Object must be a BasePart or Model."
)
end

assert(
typeof(ah.Camera)=="Instance"and ah.Camera:IsA"Camera",
"Camera must be a valid Camera instance."
)

local ai
local aj=false
local ak=Vector2.new(0,0)

local al

local function GetModelSize(am)
if not am then return Vector3.new(4,4,4)end

if am:IsA"BasePart"then
return am.Size
end

return select(2,am:GetBoundingBox())
end

local function CalculateDynamicSize()
if ah.SizeMode=="fixed"then
return ae.Height
end

local am=ag.AbsoluteSize
if am.X==0 or am.Y==0 then
return ae.Height
end

local an=ae.Height

if ah.SizeMode=="dynamic"then
local ao=math.floor(am.Y*ah.ScaleFactor)
an=math.clamp(ao,ah.MinHeight,ah.MaxHeight)
elseif ah.SizeMode=="aspect"then
local ao=am.X-20
local ap=math.floor(ao/ah.AspectRatio)
an=math.clamp(ap,ah.MinHeight,ah.MaxHeight)
end

return an
end

local am=CalculateDynamicSize()

local function UpdateCamera()
if not ah.Object then return end

local an=CFrame.new(0,0,0)*CFrame.Angles(
math.rad(ah.CameraAngle.X),
math.rad(ah.CameraAngle.Y),
math.rad(ah.CameraAngle.Z)
)*CFrame.new(0,0,ah.CameraDistance)

ah.Camera.CFrame=an
ah.Camera.Focus=CFrame.new(0,0,0)
end

local function FocusCamera()
if not ah.Object then return end

local an=GetModelSize(ah.Object)
local ao=math.max(an.X,an.Y,an.Z)
ah.CameraDistance=ao*2
local ap=ah.Object:GetPivot().Position

ah.Camera.CFrame=
CFrame.new(ap+Vector3.new(0,ao/2,ah.CameraDistance),ap)
end

local function StartAutoRotate()
if ai then
ai:Disconnect()
end

if ah.AutoRotate then
ai=d.Heartbeat:Connect(function(an)
ah.CameraAngle=ah.CameraAngle+Vector3.new(0,ah.RotationSpeed*an*10,0)
UpdateCamera()
end)
end
end

local function SetFocus(an)
ah.IsFocused=an

if not ah.FocusIndicator then return end

if al then
al:Cancel()
al=nil
end

if an then
t:Tween(FocusIndicator,t.TweenInfo,{
Transparency=0.3
})

al=i:Create(
FocusIndicator,
TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,-1,true),
{Transparency=0.1}
)
al:Play()
else
t:Tween(FocusIndicator,t.TweenInfo,{
Transparency=1
})
end
end

local an=New("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,am+30),
Visible=ah.Visible,
Parent=ag,
})

local ao=New("TextLabel",{
BackgroundTransparency=1,
Position=UDim2.new(0,12,0,1),
Size=UDim2.new(1,-20,0,25),
Text=ah.Text,
TextSize=14,
TextTransparency=0.1,
TextXAlignment=Enum.TextXAlignment.Left,
FontFace="Font",
Parent=an,
})


ao.TextColor3=t.Scheme.FontColor
t.Registry[ao]=t.Registry[ao]or{}
t.Registry[ao].TextColor3="FontColor"

New("Frame",{
AnchorPoint=Vector2.new(0.5,0),
BackgroundColor3="OutlineColor",
BackgroundTransparency=0.5,
Position=UDim2.new(0.5,0,0,26),
Size=UDim2.new(1,-26,0,1),
Parent=an,
})

local ap=New("Frame",{
BackgroundColor3=ah.BackgroundColor or"MainColor",
BorderColor3="OutlineColor",
BorderSizePixel=1,
Position=UDim2.new(0,12,0,35),
Size=UDim2.new(1,-24,0,am),
Parent=an,
})

New("UICorner",{
CornerRadius=UDim.new(0,t.CornerRadius),
Parent=ap,
})

local aq=New("ViewportFrame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
Parent=ap,
CurrentCamera=ah.Camera,
Active=ah.Interactive,
})

New("UICorner",{
CornerRadius=UDim.new(0,t.CornerRadius),
Parent=aq,
})

local ar
if ah.FocusIndicator then
ar=New("UIStroke",{
Color=t.Scheme.AccentColor,
Thickness=3,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
Transparency=1,
Parent=aq,
})
end


aq.InputBegan:Connect(function(as)
if not ah.Interactive then return end

if as.UserInputType==Enum.UserInputType.MouseButton1 then
SetFocus(true)

aj=true
ak=Vector2.new(as.Position.X,as.Position.Y)
ah.AutoRotate=false
if ai then
ai:Disconnect()
end

t:Tween(aq,TweenInfo.new(0.1),{
Size=UDim2.fromScale(0.98,0.98)
})

wait(0.1)

t:Tween(aq,TweenInfo.new(0.1),{
Size=UDim2.fromScale(1,1)
})

ah.Callback()
end
end)

aq.InputChanged:Connect(function(as)
if aj and as.UserInputType==Enum.UserInputType.MouseMovement then
local at=Vector2.new(as.Position.X,as.Position.Y)-ak
ah.CameraAngle=ah.CameraAngle+Vector3.new(-at.Y*0.5,at.X*0.5,0)
UpdateCamera()
ak=Vector2.new(as.Position.X,as.Position.Y)
end
end)

aq.InputEnded:Connect(function(as)
if as.UserInputType==Enum.UserInputType.MouseButton1 then
aj=false
end
end)


aq.InputChanged:Connect(function(as)
if not ah.Interactive or not ah.IsFocused then return end

if as.UserInputType==Enum.UserInputType.MouseWheel then local at=
ah.CameraDistance
ah.CameraDistance=math.clamp(ah.CameraDistance-(as.Position.Z*2),2,50)
UpdateCamera()
end
end)


t:GiveSignal(f.InputBegan:Connect(function(as,at)
if as.UserInputType==Enum.UserInputType.MouseButton1 and not at then
local P=n:GetMouse()
local Q=n.PlayerGui:GetGuiObjectsAtPosition(P.X,P.Y)

local R=false
for S,T in pairs(Q)do
if T==aq then
R=true
break
end
end

if not R and ah.IsFocused then
SetFocus(false)
end
end
end))


local as
if ah.SizeMode~="fixed"then
as=ag:GetPropertyChangedSignal"AbsoluteSize":Connect(function()
local at=CalculateDynamicSize()
am=at

t:Tween(an,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
Size=UDim2.new(1,0,0,am+30)
})

t:Tween(ap,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
Size=UDim2.new(1,-24,0,am)
})
end)
end

if ah.Object then
ah.Object.Parent=aq
if ah.Object:IsA"Model"and ah.Object.PrimaryPart then
ah.Object:SetPrimaryPartCFrame(CFrame.new(0,0,0))
elseif ah.Object:IsA"BasePart"then
ah.Object.CFrame=CFrame.new(0,0,0)
end
end

if ah.AutoFocus and ah.Object then
FocusCamera()
end

UpdateCamera()
StartAutoRotate()
SetFocus(false)

function ah.SetObject(at,P:Instance,Q:boolean?)
if Q then
P=P:Clone()
end

if ah.Object then
ah.Object:Destroy()
end

ah.Object=P
if ah.Object then
ah.Object.Parent=aq

if ah.Object:IsA"Model"and ah.Object.PrimaryPart then
ah.Object:SetPrimaryPartCFrame(CFrame.new(0,0,0))
elseif ah.Object:IsA"BasePart"then
ah.Object.CFrame=CFrame.new(0,0,0)
end
end

af:Resize()
end

function ah.SetHeight(at,P:number)
assert(P>0,"Height must be greater than 0.")
am=P
an.Size=UDim2.new(1,0,0,P+30)
ap.Size=UDim2.new(1,-24,0,P)
af:Resize()
end

function ah.Focus(at)
if not ah.Object then return end
FocusCamera()
end

function ah.SetCamera(at,P:Instance)
assert(
P and typeof(P)=="Instance"and P:IsA"Camera",
"Camera must be a valid Camera instance."
)

ah.Camera=P
aq.CurrentCamera=P
end

function ah.SetInteractive(at,P:boolean)
ah.Interactive=P
aq.Active=P
end

function ah.SetAutoRotate(at,P:boolean,Q:number?)
ah.AutoRotate=P
if Q then
ah.RotationSpeed=Q
end
StartAutoRotate()
end

function ah.SetCameraDistance(at,P:number)
ah.CameraDistance=P
UpdateCamera()
end

function ah.SetCameraAngle(at,P:Vector3)
ah.CameraAngle=P
UpdateCamera()
end

function ah.SetFocus(at,P:boolean)
SetFocus(P)
end

function ah.ToggleFocus(at)
SetFocus(not ah.IsFocused)
end

function ah.IsFocused(at)
return ah.IsFocused
end

function ah.SetSizeMode(at,P:string,Q:table?)
ah.SizeMode=P
if Q then
if Q.MinHeight then ah.MinHeight=Q.MinHeight end
if Q.MaxHeight then ah.MaxHeight=Q.MaxHeight end
if Q.AspectRatio then ah.AspectRatio=Q.AspectRatio end
if Q.ScaleFactor then ah.ScaleFactor=Q.ScaleFactor end
end

if as then
as:Disconnect()
as=nil
end

local R=CalculateDynamicSize()
am=R

an.Size=UDim2.new(1,0,0,am+30)
ap.Size=UDim2.new(1,-24,0,am)

if ah.SizeMode~="fixed"then
as=ag:GetPropertyChangedSignal"AbsoluteSize":Connect(function()
local S=CalculateDynamicSize()
am=S

t:Tween(an,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
Size=UDim2.new(1,0,0,am+30)
})

t:Tween(ap,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
Size=UDim2.new(1,-24,0,am)
})
end)
end
end

function ah.SetVisible(at,P:boolean)
ah.Visible=P
an.Visible=ah.Visible
af:Resize()
end

function ah.Destroy(at)
if ai then
ai:Disconnect()
end
if as then
as:Disconnect()
end
if al then
al:Cancel()
end
an:Destroy()
end

af:Resize()

ah.Holder=an
table.insert(af.Elements,ah)

s[ad]=ah

return ah
end

function ab.AddImage(ac,ad,ae)
ae=t:Validate(ae,v.Image)

local af=ac
local ag=af.Container

local ah={
Image=ae.Image,
Color=ae.Color,
RectOffset=ae.RectOffset,
RectSize=ae.RectSize,
Height=ae.Height,
ScaleType=ae.ScaleType,
Transparency=ae.Transparency,

Visible=ae.Visible,
Type="Image",
}

local ai=New("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,ae.Height),
Visible=ah.Visible,
Parent=ag,
})

local aj=New("Frame",{
AnchorPoint=Vector2.new(0,1),
BackgroundColor3="MainColor",
BorderColor3="OutlineColor",
BorderSizePixel=1,
Position=UDim2.fromScale(0,1),
Size=UDim2.fromScale(1,1),
Parent=ai,
})

New("UIPadding",{
PaddingBottom=UDim.new(0,3),
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
PaddingTop=UDim.new(0,4),
Parent=aj,
})

local ak={
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
Image=ah.Image,
ImageTransparency=ah.Transparency,
ImageColor3=ah.Color,
ImageRectOffset=ah.RectOffset,
ImageRectSize=ah.RectSize,
ScaleType=ah.ScaleType,
Parent=aj,
}

if
not(
ak.Image:match"rbxasset"
or ak.Image:match"roblox%.com/asset/%?id="
or ak.Image:match"rbxthumb://type=AvatarHeadShot"
)
then
local al=t:GetIcon(ak.Image)
assert(al,"Image must be a valid Roblox asset or a valid URL or a valid lucide icon.")

ak.Image=al.Url
ak.ImageRectOffset=al.ImageRectOffset
ak.ImageRectSize=al.ImageRectSize
end

local al=New("ImageLabel",ak)

function ah.SetHeight(am,an:number)
assert(an>0,"Height must be greater than 0.")

ah.Height=an
ai.Size=UDim2.new(1,0,0,an)
af:Resize()
end

function ah.SetImage(am,an:string)
assert(typeof(an)=="string","Image must be a string.")

if
not(
an:match"rbxasset"
or an:match"roblox%.com/asset/%?id="
or an:match"rbxthumb://type=AvatarHeadShot"
)
then
local ao=t:GetIcon(an)
assert(ao,"Image must be a valid Roblox asset or a valid URL or a valid lucide icon.")

an=ao.Url
ah.RectOffset=ao.ImageRectOffset
ah.RectSize=ao.ImageRectSize
end

al.Image=an
ah.Image=an
end

function ah.SetColor(am,an:Color3)
assert(typeof(an)=="Color3","Color must be a Color3 value.")

al.ImageColor3=an
ah.Color=an
end

function ah.SetRectOffset(am,an:Vector2)
assert(typeof(an)=="Vector2","RectOffset must be a Vector2 value.")

al.ImageRectOffset=an
ah.RectOffset=an
end

function ah.SetRectSize(am,an:Vector2)
assert(typeof(an)=="Vector2","RectSize must be a Vector2 value.")

al.ImageRectSize=an
ah.RectSize=an
end

function ah.SetScaleType(am,an:Enum.ScaleType)
assert(
typeof(an)=="EnumItem"and an:IsA"ScaleType",
"ScaleType must be a valid Enum.ScaleType."
)

al.ScaleType=an
ah.ScaleType=an
end

function ah.SetTransparency(am,an:number)
assert(typeof(an)=="number","Transparency must be a number between 0 and 1.")
assert(an>=0 and an<=1,"Transparency must be between 0 and 1.")

al.ImageTransparency=an
ah.Transparency=an
end

function ah.SetVisible(am,an:boolean)
ah.Visible=an

ai.Visible=ah.Visible
af:Resize()
end

af:Resize()

ah.Holder=ai
table.insert(af.Elements,ah)

s[ad]=ah

return ah
end

function ab.AddDependencyBox(ac)
local ad=ac
local ae=ad.Container

local af
local ag

do
af=New("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
Visible=false,
Parent=ae,
})

ag=New("UIListLayout",{
Padding=UDim.new(0,8),
Parent=af,
})
end

local ah={
Visible=false,
Dependencies={},

Holder=af,
Container=af,

Elements={},
DependencyBoxes={},
}

function ah.Resize(ai)
af.Size=UDim2.new(1,0,0,ag.AbsoluteContentSize.Y*t.DPIScale)
ad:Resize()
end

function ah.Update(ai,aj)
for ak,al in pairs(ah.Dependencies)do
local am=al[1]
local an=al[2]

if am.Type=="Toggle"and am.Value~=an then
af.Visible=false
ah.Visible=false
return
elseif am.Type=="Dropdown"then
if typeof(am.Value)=="table"then
if not am.Value[an]then
af.Visible=false
ah.Visible=false
return
end
else
if am.Value~=an then
af.Visible=false
ah.Visible=false
return
end
end
end
end

ah.Visible=true
af.Visible=true
if not t.Searching then
ah:Resize()
elseif not aj then
t:UpdateSearch(t.SearchText)
end
end

function ah.SetupDependencies(ai,aj)
for ak,al in pairs(aj)do
assert(typeof(al)=="table","Dependency should be a table.")
assert(al[1]~=nil,"Dependency is missing element.")
assert(al[2]~=nil,"Dependency is missing expected value.")
end

ah.Dependencies=aj
ah:Update()
end

af:GetPropertyChangedSignal"Visible":Connect(function()
ah:Resize()
end)

setmetatable(ah,aa)

table.insert(ad.DependencyBoxes,ah)
table.insert(t.DependencyBoxes,ah)

return ah
end

function ab.AddDependencyGroupbox(ac)
local ad=ac
local ae=ad.Tab
local af=ad.BoxHolder

local ag=t:MakeOutline(af,t.CornerRadius)
ag.Size=UDim2.fromScale(1,0)
ag.Visible=false
t:UpdateDPI(ag,{
Size=false,
})

local ah
local ai

do
ah=New("Frame",{
BackgroundColor3="BackgroundColor",
Position=UDim2.fromOffset(2,2),
Size=UDim2.new(1,-4,1,-4),
Parent=ag,
})
New("UICorner",{
CornerRadius=UDim.new(0,t.CornerRadius-1),
Parent=ah,
})

ai=New("UIListLayout",{
Padding=UDim.new(0,8),
Parent=ah,
})
New("UIPadding",{
PaddingBottom=UDim.new(0,7),
PaddingLeft=UDim.new(0,7),
PaddingRight=UDim.new(0,7),
PaddingTop=UDim.new(0,7),
Parent=ah,
})
end

local aj={
Visible=false,
Dependencies={},

BoxHolder=af,
Holder=ag,
Container=ah,

Tab=ae,
Elements={},
DependencyBoxes={},
}

function aj.Resize(ak)
ag.Size=UDim2.new(1,0,0,ai.AbsoluteContentSize.Y+18*t.DPIScale)
end

function aj.Update(ak,al)
for am,an in pairs(aj.Dependencies)do
local ao=an[1]
local ap=an[2]

if ao.Type=="Toggle"and ao.Value~=ap then
ag.Visible=false
aj.Visible=false
return
elseif ao.Type=="Dropdown"then
if typeof(ao.Value)=="table"then
if not ao.Value[ap]then
ag.Visible=false
aj.Visible=false
return
end
else
if ao.Value~=ap then
ag.Visible=false
aj.Visible=false
return
end
end
end
end

aj.Visible=true
if not t.Searching then
ag.Visible=true
aj:Resize()
elseif not al then
t:UpdateSearch(t.SearchText)
end
end

function aj.SetupDependencies(ak,al)
for am,an in pairs(al)do
assert(typeof(an)=="table","Dependency should be a table.")
assert(an[1]~=nil,"Dependency is missing element.")
assert(an[2]~=nil,"Dependency is missing expected value.")
end

aj.Dependencies=al
aj:Update()
end

setmetatable(aj,aa)

table.insert(ae.DependencyGroupboxes,aj)
table.insert(t.DependencyBoxes,aj)

return aj
end

aa.__index=ab
aa.__namecall=function(ac,ad,...)
return ab[ad](...)
end
end

function t.SetFont(ab,ac)
if typeof(ac)=="EnumItem"then
ac=Font.fromEnum(ac)
end

t.Scheme.Font=ac
t:UpdateColorsUsingRegistry()
end

function t.SetNotifySide(ab,ac:string)
t.NotifySide=ac

if ac:lower()=="left"then
F.AnchorPoint=Vector2.new(0,0)
F.Position=UDim2.fromOffset(6,6)
G.HorizontalAlignment=Enum.HorizontalAlignment.Left
else
F.AnchorPoint=Vector2.new(1,0)
F.Position=UDim2.new(1,-6,0,6)
G.HorizontalAlignment=Enum.HorizontalAlignment.Right
end
end

function t.Notify(ab,...)
local ac={}
local ad=select(1,...)

if typeof(ad)=="table"then
ac.Title=tostring(ad.Title)
ac.Description=tostring(ad.Description)
ac.Time=ad.Time or 5
ac.SoundId=ad.SoundId
ac.Steps=ad.Steps
ac.Persist=ad.Persist
else
ac.Description=tostring(ad)
ac.Time=select(2,...)or 5
ac.SoundId=select(3,...)
end
ac.Destroyed=false

local ae=false
local af
if typeof(ac.Time)=="Instance"then
af=ac.Time.Destroying:Connect(function()
ae=true

af:Disconnect()
af=nil
end)
end

local ag=New("Frame",{
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
Size=UDim2.fromScale(1,0),
Visible=false,
Parent=F,

DPIExclude={
Size=true,
},
})

local ah=t:MakeOutline(ag,t.CornerRadius,5)
ah.AutomaticSize=Enum.AutomaticSize.Y
ah.Position=t.NotifySide:lower()=="left"and UDim2.new(-1,-6,0,-2)or UDim2.new(1,6,0,-2)
ah.Size=UDim2.fromScale(1,0)
t:UpdateDPI(ah,{
Position=false,
Size=false,
})

local ai=New("Frame",{
BackgroundColor3="MainColor",
Position=UDim2.fromOffset(2,2),
Size=UDim2.new(1,-4,1,-4),
Parent=ah,
})
New("UICorner",{
CornerRadius=UDim.new(0,t.CornerRadius-1),
Parent=ai,
})
New("UIListLayout",{
Padding=UDim.new(0,4),
Parent=ai,
})
New("UIPadding",{
PaddingBottom=UDim.new(0,8),
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
PaddingTop=UDim.new(0,8),
Parent=ai,
})

local aj
local ak
local al=0
local am=0

local an

if ac.Title then
aj=New("TextLabel",{
BackgroundTransparency=1,
Text=ac.Title,
TextSize=15,
TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,
Parent=ai,

DPIExclude={
Size=true,
},
})
end

if ac.Description then
ak=New("TextLabel",{
BackgroundTransparency=1,
Text=ac.Description,
TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,
Parent=ai,

DPIExclude={
Size=true,
},
})
end

function ac.Resize(ao)
if aj then
local ap,aq=t:GetTextBounds(
aj.Text,
aj.FontFace,
aj.TextSize,
F.AbsoluteSize.X-(24*t.DPIScale)
)
aj.Size=UDim2.fromOffset(math.ceil(ap),aq)
al=ap
end

if ak then
local ap,aq=t:GetTextBounds(
ak.Text,
ak.FontFace,
ak.TextSize,
F.AbsoluteSize.X-(24*t.DPIScale)
)
ak.Size=UDim2.fromOffset(math.ceil(ap),aq)
am=ap
end

ag.Size=UDim2.fromOffset((al>am and al or am)+(24*t.DPIScale),0)
end

function ac.ChangeTitle(ao,ap)
if aj then
ac.Title=tostring(ap)
aj.Text=ac.Title
ac:Resize()
end
end

function ac.ChangeDescription(ao,ap)
if ak then
ac.Description=tostring(ap)
ak.Text=ac.Description
ac:Resize()
end
end

function ac.ChangeStep(ao,ap)
if an and ac.Steps then
ap=math.clamp(ap or 0,0,ac.Steps)
an.Size=UDim2.fromScale(ap/ac.Steps,1)
end
end

function ac.Destroy(ao)
ac.Destroyed=true
if af then
af:Disconnect()
end

i
:Create(ah,t.NotifyTweenInfo,{
Position=t.NotifySide:lower()=="left"and UDim2.new(-1,-6,0,-2)or UDim2.new(1,6,0,-2),
})
:Play()
task.delay(t.NotifyTweenInfo.Time,function()
t.Notifications[ag]=nil
ag:Destroy()
end)
end

ac:Resize()

local ao=New("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,7),
Visible=(ac.Persist~=true and typeof(ac.Time)~="Instance")or typeof(ac.Steps)=="number",
Parent=ai,
})
local ap=New("Frame",{
BackgroundColor3="BackgroundColor",
BorderColor3="OutlineColor",
BorderSizePixel=1,
Position=UDim2.fromOffset(0,3),
Size=UDim2.new(1,0,0,2),
Parent=ao,
})
an=New("Frame",{
BackgroundColor3="AccentColor",
Size=UDim2.fromScale(1,1),
Parent=ap,
})

if typeof(ac.Time)=="Instance"then
an.Size=UDim2.fromScale(0,1)
end
if ac.SoundId then
local aq=ac.SoundId
if typeof(aq)=="number"then
aq=`rbxassetid://{aq}`
end

New("Sound",{
SoundId=aq,
Volume=3,
PlayOnRemove=true,
Parent=e,
}):Destroy()
end

t.Notifications[ag]=ac

ag.Visible=true
i:Create(ah,t.NotifyTweenInfo,{
Position=UDim2.fromOffset(-2,-2),
}):Play()

task.delay(t.NotifyTweenInfo.Time,function()
if ac.Persist then
return
elseif typeof(ac.Time)=="Instance"then
repeat
task.wait()
until ae or ac.Destroyed
else
i
:Create(an,TweenInfo.new(ac.Time,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{
Size=UDim2.fromScale(0,1),
})
:Play()
task.wait(ac.Time)
end

if not ac.Destroyed then
ac:Destroy()
end
end)

return ac
end

function t.CreateLoader(ab,ac,ad)
local ae=New("ScreenGui",{
Name="ObsidianLoader",
Parent=b,
Enabled=true,
ResetOnSpawn=false,
IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Global,
})

local af=New("Frame",{
Name="Loader",
Parent=ae,
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundColor3=Color3.new(0,0,0),
BackgroundTransparency=1,
BorderSizePixel=0,
Position=UDim2.new(0.5,0,0.5,0),
Size=UDim2.new(1,0,1,0),
})

local ag=New("ImageLabel",{
Name="Icon",
Parent=af,
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
BorderSizePixel=0,
Position=UDim2.new(0.5,0,0.5,0),
Size=UDim2.new(0,750,0,750),
ZIndex=100,
ImageTransparency=1,
})


if ac then
local ah=t:GetIcon(tostring(ac))
if ah then
ag.Image=ah.Url
ag.ImageRectOffset=ah.ImageRectOffset
ag.ImageRectSize=ah.ImageRectSize
end
end


if not t.Registry[ag]then
t.Registry[ag]={}
end
t.Registry[ag].ImageColor3="AccentColor"
ag.ImageColor3=t.Scheme.AccentColor

local ah=New("ImageLabel",{
Name="Vignette",
Parent=af,
BackgroundTransparency=1,
BorderSizePixel=0,
Size=UDim2.new(1,0,1,0),
Image="rbxassetid://18720640102",
ImageTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),
})


if not t.Registry[ah]then
t.Registry[ah]={}
end
t.Registry[ah].ImageColor3="AccentColor"
ah.ImageColor3=t.Scheme.AccentColor


i:Create(af,TweenInfo.new(0.55,Enum.EasingStyle.Quint),{
BackgroundTransparency=0.5
}):Play()

local ai=Instance.new'BindableEvent'

task.delay(0.5,function()
i:Create(ag,TweenInfo.new(0.75,Enum.EasingStyle.Quint),{
ImageTransparency=0.01,
Size=UDim2.new(0,200,0,200)
}):Play()

task.delay(0.25,function()
i:Create(ah,TweenInfo.new(5),{
ImageTransparency=0.2
}):Play()

task.wait(ad or 4.5)

i:Create(ah,TweenInfo.new(3,Enum.EasingStyle.Quint,Enum.EasingDirection.InOut),{
Size=UDim2.new(2,0,2,0)
}):Play()

i:Create(ag,TweenInfo.new(0.75,Enum.EasingStyle.Quint,Enum.EasingDirection.InOut),{
ImageTransparency=1,
}):Play()

i:Create(af,TweenInfo.new(1.5,Enum.EasingStyle.Quint,Enum.EasingDirection.InOut),{
BackgroundTransparency=1
}):Play()

task.delay(0.1,function()
i:Create(ah,TweenInfo.new(1,Enum.EasingStyle.Quint,Enum.EasingDirection.InOut),{
ImageTransparency=1
}):Play()

task.wait(0.2)

task.delay(3,function()
ae:Destroy()
end)
end)

task.delay(0.6,function()
ai:Fire()
end)
end)
end)

return{
yield=function()
return ai.Event:Wait()
end
}
end

function t.CreateWindow(ab,ac)
ac=t:Validate(ac,v.Window)
local ad:Vector2=workspace.CurrentCamera.ViewportSize
if d:IsStudio()and ad.X<=5 and ad.Y<=5 then
repeat
ad=workspace.CurrentCamera.ViewportSize
task.wait()
until ad.X>5 and ad.Y>5
end

local ae=ad.X-64
local af=ad.Y-64

t.MinSize=Vector2.new(math.min(t.MinSize.X,ae),math.min(t.MinSize.Y,af))
ac.Size=UDim2.fromOffset(
math.clamp(ac.Size.X.Offset,t.MinSize.X,ae),
math.clamp(ac.Size.Y.Offset,t.MinSize.Y,af)
)
if typeof(ac.Font)=="EnumItem"then
ac.Font=Font.fromEnum(ac.Font)
end

t.CornerRadius=ac.CornerRadius
t:SetNotifySide(ac.NotifySide)
t.ShowCustomCursor=ac.ShowCustomCursor
t.Scheme.Font=ac.Font
t.ToggleKeybind=ac.ToggleKeybind

local ag
local ah
local ai
local aj
local ak
local al
local am
local an
do
t.KeybindFrame,t.KeybindContainer=t:AddDraggableMenu"Keybinds"
t.KeybindFrame.AnchorPoint=Vector2.new(0,0.5)
t.KeybindFrame.Position=UDim2.new(0,6,0.5,0)
t.KeybindFrame.Visible=false
t:UpdateDPI(t.KeybindFrame,{
Position=false,
Size=false,
})

ag=New("Frame",{
BackgroundColor3=function()
return t:GetBetterColor(t.Scheme.BackgroundColor,-1)
end,
Name="Main",
Position=ac.Position,
Size=ac.Size,
Visible=false,
Parent=B,

DPIExclude={
Position=true,
},
})
New("UICorner",{
CornerRadius=UDim.new(0,ac.CornerRadius-1),
Parent=ag,
})
do
local ao={
{
Position=UDim2.fromOffset(0,48),
Size=UDim2.new(1,0,0,1),
},
{
AnchorPoint=Vector2.new(0,1),
Position=UDim2.new(0,0,1,-20),
Size=UDim2.new(1,0,0,1),
},
}
for ap,aq in pairs(ao)do
t:MakeLine(ag,aq)
end
t:MakeOutline(ag,ac.CornerRadius,0)
end

if ac.BackgroundImage then
New("ImageLabel",{
Image=ac.BackgroundImage,
Position=UDim2.fromScale(0,0),
Size=UDim2.fromScale(1,1),
ScaleType=Enum.ScaleType.Stretch,
ZIndex=999,
BackgroundTransparency=1,
ImageTransparency=0.75,
Parent=ag,
})
end

if ac.Center then
ag.Position=UDim2.new(0.5,-ag.Size.X.Offset/2,0.5,-ag.Size.Y.Offset/2)
end


local ao=New("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,48),
Parent=ag,
})
t:MakeDraggable(ag,ao,false,true)


local ap=New("Frame",{
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),
Size=UDim2.fromScale(0.4,1),
Parent=ao,
})
New("UIListLayout",{
FillDirection=Enum.FillDirection.Horizontal,
HorizontalAlignment=Enum.HorizontalAlignment.Center,
VerticalAlignment=Enum.VerticalAlignment.Center,
Padding=UDim.new(0,6),
Parent=ap,
})

if ac.Icon then
New("ImageLabel",{
Image=if tonumber(ac.Icon)then`rbxassetid://{ac.Icon}`else ac.Icon,
Size=ac.IconSize,
Parent=ap,
})
end

local aq=t:GetTextBounds(
ac.Title,
t.Scheme.Font,
20,
ap.AbsoluteSize.X-(ac.Icon and ac.IconSize.X.Offset+6 or 0)-12
)
New("TextLabel",{
BackgroundTransparency=1,
Size=UDim2.new(0,aq,1,0),
Text=ac.Title,
TextSize=20,
Parent=ap,
})


local ar=New("Frame",{
BackgroundTransparency=1,
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-10,0.5,0),
Size=UDim2.new(0,300,1,-16),
Parent=ao,
})

New("UIListLayout",{
FillDirection=Enum.FillDirection.Horizontal,
HorizontalAlignment=Enum.HorizontalAlignment.Right,
VerticalAlignment=Enum.VerticalAlignment.Center,
Padding=UDim.new(0,8),
Parent=ar,
})

ai=New("Frame",{
Size=UDim2.fromScale(ac.DisableSearch and 1 or 0.5,1),
Visible=false,
BackgroundTransparency=1,
Parent=ar,
})

New("UIListLayout",{
FillDirection=Enum.FillDirection.Vertical,
HorizontalAlignment=Enum.HorizontalAlignment.Left,
VerticalAlignment=Enum.VerticalAlignment.Center,
Parent=ai,
})

New("UIPadding",{
PaddingBottom=UDim.new(0,8),
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
PaddingTop=UDim.new(0,8),
Parent=ai,
})

aj=New("TextLabel",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,0),
AutomaticSize=Enum.AutomaticSize.Y,
Text="",
TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,
Parent=ai,
})

ak=New("TextLabel",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,0),
AutomaticSize=Enum.AutomaticSize.Y,
Text="",
TextWrapped=true,
TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,
TextTransparency=0.5,
Parent=ai,
})


local as=New("Frame",{
BackgroundTransparency=1,
Position=UDim2.new(1,-300,0,0),
Size=UDim2.new(0,300,1,0),
Visible=not(ac.DisableSearch or false),
Parent=ao,
})


local at=New("TextButton",{
AnchorPoint=Vector2.new(1,0.5),
BackgroundColor3="MainColor",
Position=UDim2.new(1,-10,0.5,0),
Size=UDim2.fromOffset(24,24),
Text="",
ZIndex=2,
Parent=as,
})
New("UICorner",{
CornerRadius=UDim.new(0,ac.CornerRadius),
Parent=at,
})
New("UIStroke",{
Color="OutlineColor",
Parent=at,
})


local P=t:GetIcon"search"
if P then
New("ImageLabel",{
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Image=P.Url,
ImageColor3="FontColor",
ImageRectOffset=P.ImageRectOffset,
ImageRectSize=P.ImageRectSize,
Position=UDim2.fromScale(0.5,0.5),
Size=UDim2.fromOffset(16,16),
Parent=at,
})
end


ah=New("TextBox",{
AnchorPoint=Vector2.new(1,0.5),
BackgroundColor3="MainColor",
PlaceholderText="Search...",
Position=UDim2.fromScale(1,0.5),
Size=UDim2.fromOffset(0,32),
Text="",
TextScaled=true,
TextXAlignment=Enum.TextXAlignment.Left,
Visible=false,
ZIndex=1,
Parent=as,
})
New("UICorner",{
CornerRadius=UDim.new(0,ac.CornerRadius),
Parent=ah,
})
New("UIPadding",{
PaddingBottom=UDim.new(0,8),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,8),
PaddingTop=UDim.new(0,8),
Parent=ah,
})
New("UIStroke",{
Color="OutlineColor",
Parent=ah,
})




local Q=false


local function ExpandSearch()
if Q then return end
Q=true

ah.Visible=true
at.Visible=false

local R=i:Create(ah,TweenInfo.new(0.3,Enum.EasingStyle.Quad),{
Size=UDim2.fromOffset(180,32)
})
R:Play()

R.Completed:Connect(function()
ah:CaptureFocus()
end)
end


local function CollapseSearch()
if not Q then return end
Q=false

ah:ReleaseFocus()
ah.Text=""
t:UpdateSearch""

local R=i:Create(ah,TweenInfo.new(0.3,Enum.EasingStyle.Quad),{
Size=UDim2.fromOffset(0,32)
})
R:Play()

R.Completed:Connect(function()
ah.Visible=false
at.Visible=true
end)
end


at.MouseButton1Click:Connect(ExpandSearch)

ah.FocusLost:Connect(function()
if ah.Text==""then
CollapseSearch()
end
end)




local R=New("Frame",{
AnchorPoint=Vector2.new(0,1),
BackgroundColor3=function()
return t:GetBetterColor(t.Scheme.BackgroundColor,4)
end,
Position=UDim2.fromScale(0,1),
Size=UDim2.new(1,0,0,20),
Parent=ag,
})
do
local S=t:MakeCover(R,"Top")
t:AddToRegistry(S,{
BackgroundColor3=function()
return t:GetBetterColor(t.Scheme.BackgroundColor,4)
end,
})
end
New("UICorner",{
CornerRadius=UDim.new(0,ac.CornerRadius-1),
Parent=R,
})


New("TextLabel",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
Text=ac.Footer,
TextSize=14,
TextTransparency=0.5,
Parent=R,
})


if ac.Resizable then
al=New("TextButton",{
AnchorPoint=Vector2.new(1,0),
BackgroundTransparency=1,
Position=UDim2.fromScale(1,0),
Size=UDim2.fromScale(1,1),
SizeConstraint=Enum.SizeConstraint.RelativeYY,
Text="",
Parent=R,
})

t:MakeResizable(ag,al,function()
for S,T in pairs(t.Tabs)do
T:Resize(true)
end
end)
end

New("ImageLabel",{
Image=M and M.Url or"",
ImageColor3="FontColor",
ImageRectOffset=M and M.ImageRectOffset or Vector2.zero,
ImageRectSize=M and M.ImageRectSize or Vector2.zero,
ImageTransparency=0.5,
Position=UDim2.fromOffset(2,2),
Size=UDim2.new(1,-4,1,-4),
Parent=al,
})


am=New("ScrollingFrame",{
AutomaticCanvasSize=Enum.AutomaticSize.Y,
BackgroundColor3="BackgroundColor",
CanvasSize=UDim2.fromScale(0,0),
Position=UDim2.fromOffset(0,49),
ScrollBarThickness=0,
Size=UDim2.new(0.25,0,1,-70),
Parent=ag,
})

New("UIListLayout",{
Parent=am,
})


an=New("Frame",{
AnchorPoint=Vector2.new(1,0),
BackgroundColor3=function()
return t:GetBetterColor(t.Scheme.BackgroundColor,1)
end,
Name="Container",
Position=UDim2.new(1,0,0,49),
Size=UDim2.new(0.75,-1,1,-70),
Parent=ag,
})

New("UIPadding",{
PaddingBottom=UDim.new(0,0),
PaddingLeft=UDim.new(0,6),
PaddingRight=UDim.new(0,6),
PaddingTop=UDim.new(0,0),
Parent=an,
})
end


local ao={}

function ao.AddTab(ap,...)
local aq
local ar
local as

if select("#",...)==1 and typeof(...)=="table"then
local at=select(1,...)
aq=at.Name or"Tab"
ar=at.Icon
as=at.Description
else
aq=select(1,...)
ar=select(2,...)
as=select(3,...)
end

local at:TextButton
local P
local Q

local R
local S
local T

local U
local V
local W
local X

ar=t:GetIcon(ar)
do
at=New("TextButton",{
BackgroundColor3="MainColor",
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,40),
Text="",
Parent=am,
})

New("UIPadding",{
PaddingBottom=UDim.new(0,11),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
PaddingTop=UDim.new(0,11),
Parent=at,
})

P=New("TextLabel",{
BackgroundTransparency=1,
Position=UDim2.fromOffset(30,0),
Size=UDim2.new(1,-30,1,0),
Text=aq,
TextSize=16,
TextTransparency=0.5,
TextXAlignment=Enum.TextXAlignment.Left,
Parent=at,
})

if ar then
Q=New("ImageLabel",{
Image=ar.Url,
ImageColor3="AccentColor",
ImageRectOffset=ar.ImageRectOffset,
ImageRectSize=ar.ImageRectSize,
ImageTransparency=0.5,
Size=UDim2.fromScale(1,1),
SizeConstraint=Enum.SizeConstraint.RelativeYY,
Parent=at,
})
end


R=New("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
Visible=false,
Parent=an,
})

S=New("ScrollingFrame",{
AutomaticCanvasSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
CanvasSize=UDim2.fromScale(0,0),
ScrollBarThickness=0,
Parent=R,
})
New("UIListLayout",{
Padding=UDim.new(0,6),
Parent=S,
})
do
New("Frame",{
BackgroundTransparency=1,
LayoutOrder=-1,
Parent=S,
})
New("Frame",{
BackgroundTransparency=1,
LayoutOrder=1,
Parent=S,
})

S.Size=UDim2.new(0,math.floor(R.AbsoluteSize.X/2)-3,1,0)
t:UpdateDPI(S,{Size=S.Size})
end

T=New("ScrollingFrame",{
AnchorPoint=Vector2.new(1,0),
AutomaticCanvasSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
CanvasSize=UDim2.fromScale(0,0),
Position=UDim2.fromScale(1,0),
ScrollBarThickness=0,
Parent=R,
})
New("UIListLayout",{
Padding=UDim.new(0,6),
Parent=T,
})
do
New("Frame",{
BackgroundTransparency=1,
LayoutOrder=-1,
Parent=T,
})
New("Frame",{
BackgroundTransparency=1,
LayoutOrder=1,
Parent=T,
})

T.Size=UDim2.new(0,math.floor(R.AbsoluteSize.X/2)-3,1,0)
t:UpdateDPI(T,{Size=T.Size})
end

U=New("Frame",{
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundColor3=Color3.fromRGB(127,0,0),
BorderColor3=Color3.fromRGB(255,50,50),
BorderMode=Enum.BorderMode.Inset,
BorderSizePixel=1,
Position=UDim2.fromOffset(0,6),
Size=UDim2.fromScale(1,0),
Visible=false,
Parent=R,
})
New("UIPadding",{
PaddingBottom=UDim.new(0,4),
PaddingLeft=UDim.new(0,6),
PaddingRight=UDim.new(0,6),
PaddingTop=UDim.new(0,4),
Parent=U,
})

V=New("TextLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,14),
Text="",
TextColor3=Color3.fromRGB(255,50,50),
TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,
Parent=U,
})
X=New("UIStroke",{
ApplyStrokeMode=Enum.ApplyStrokeMode.Contextual,
Color=Color3.fromRGB(169,0,0),
LineJoinMode=Enum.LineJoinMode.Miter,
Parent=V,
})

W=New("TextLabel",{
BackgroundTransparency=1,
Position=UDim2.fromOffset(0,16),
Size=UDim2.fromScale(1,0),
Text="",
TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,
Parent=U,
})
New("UIStroke",{
ApplyStrokeMode=Enum.ApplyStrokeMode.Contextual,
Color="Dark",
LineJoinMode=Enum.LineJoinMode.Miter,
Parent=W,
})
end


local Y={
Groupboxes={},
Tabboxes={},
DependencyGroupboxes={},
Sides={
S,
T,
},
}

function Y.UpdateWarningBox(Z,_)
if typeof(_.Visible)=="boolean"then
U.Visible=_.Visible
Y:Resize()
end

if typeof(_.Title)=="string"then
V.Text=_.Title
end

if typeof(_.Text)=="string"then local
au, av=t:GetTextBounds(
_.Text,
t.Scheme.Font,
W.TextSize,
W.AbsoluteSize.X
)

W.Size=UDim2.new(1,0,0,av)
W.Text=_.Text
t:UpdateDPI(W,{Size=W.Size})
Y:Resize()
end

U.BackgroundColor3=_.IsNormal==true and t.Scheme.BackgroundColor
or Color3.fromRGB(127,0,0)
U.BorderColor3=_.IsNormal==true and t.Scheme.OutlineColor
or Color3.fromRGB(255,50,50)
V.TextColor3=_.IsNormal==true and t.Scheme.FontColor or Color3.fromRGB(255,50,50)
X.Color=_.IsNormal==true and t.Scheme.OutlineColor or Color3.fromRGB(169,0,0)

if not t.Registry[U]then
t:AddToRegistry(U,{})
end
if not t.Registry[V]then
t:AddToRegistry(V,{})
end
if not t.Registry[X]then
t:AddToRegistry(X,{})
end

t.Registry[U].BackgroundColor3=function()
return _.IsNormal==true and t.Scheme.BackgroundColor or Color3.fromRGB(127,0,0)
end

t.Registry[U].BorderColor3=function()
return _.IsNormal==true and t.Scheme.OutlineColor or Color3.fromRGB(255,50,50)
end

t.Registry[V].TextColor3=function()
return _.IsNormal==true and t.Scheme.FontColor or Color3.fromRGB(255,50,50)
end

t.Registry[X].Color=function()
return _.IsNormal==true and t.Scheme.OutlineColor or Color3.fromRGB(169,0,0)
end
end

function Y.Resize(au,av:boolean?)
if av then local
Z, _=t:GetTextBounds(
W.Text,
t.Scheme.Font,
W.TextSize,
W.AbsoluteSize.X
)

W.Size=UDim2.new(1,0,0,_)
t:UpdateDPI(W,{Size=W.Size})
end

local Z=U.Visible and U.AbsoluteSize.Y+6 or 0
for _,aw in pairs(Y.Sides)do
aw.Position=UDim2.new(aw.Position.X.Scale,0,0,Z)
aw.Size=UDim2.new(0,math.floor(R.AbsoluteSize.X/2)-3,1,-Z)
t:UpdateDPI(aw,{
Position=aw.Position,
Size=aw.Size,
})
end
end

function Y.AddGroupbox(au,av)
local aw=New("Frame",{
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
Size=UDim2.fromScale(1,0),
Parent=av.Side==1 and S or T,
})
New("UIListLayout",{
Padding=UDim.new(0,6),
Parent=aw,
})

local Z=t:MakeOutline(aw,ac.CornerRadius)
Z.Size=UDim2.fromScale(1,0)
t:UpdateDPI(Z,{
Size=false,
})

local _
local ax

local ay
local az

do
_=New("Frame",{
BackgroundColor3="BackgroundColor",
Position=UDim2.fromOffset(2,2),
Size=UDim2.new(1,-4,1,-4),
Parent=Z,
})
New("UICorner",{
CornerRadius=UDim.new(0,ac.CornerRadius-1),
Parent=_,
})
t:MakeLine(_,{
Position=UDim2.fromOffset(0,34),
Size=UDim2.new(1,0,0,1),
})

local aA=t:GetIcon(av.IconName)
if aA then

local aB=New("Frame",{
BackgroundColor3="MainColor",
BorderSizePixel=1,
BorderColor3="OutlineColor",
Position=UDim2.fromOffset(6,6),
Size=UDim2.fromOffset(22,22),
Parent=_,
})
New("UICorner",{
CornerRadius=UDim.new(0,3),
Parent=aB,
})


New("ImageLabel",{
BackgroundTransparency=1,
Image=aA.Url,
ImageColor3="AccentColor",
ImageRectOffset=aA.ImageRectOffset,
ImageRectSize=aA.ImageRectSize,
Position=UDim2.fromOffset(2,2),
Size=UDim2.fromOffset(18,18),
Parent=aB,
})
end

ax=New("TextLabel",{
BackgroundTransparency=1,
Position=UDim2.fromOffset(aA and 24 or 0,0),
Size=UDim2.new(1,0,0,34),
Text=av.Name,
TextSize=15,
TextXAlignment=Enum.TextXAlignment.Left,
Parent=_,
})
New("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
Parent=ax,
})

ay=New("Frame",{
BackgroundTransparency=1,
Position=UDim2.fromOffset(0,35),
Size=UDim2.new(1,0,1,-35),
Parent=_,
})

az=New("UIListLayout",{
Padding=UDim.new(0,8),
Parent=ay,
})
New("UIPadding",{
PaddingBottom=UDim.new(0,7),
PaddingLeft=UDim.new(0,7),
PaddingRight=UDim.new(0,7),
PaddingTop=UDim.new(0,7),
Parent=ay,
})
end

local aA={
BoxHolder=aw,
Holder=Z,
Container=ay,

Tab=Y,
DependencyBoxes={},
Elements={},
}

function aA.Resize(aB)
Z.Size=UDim2.new(1,0,0,az.AbsoluteContentSize.Y+53*t.DPIScale)
end

setmetatable(aA,aa)

aA:Resize()
Y.Groupboxes[av.Name]=aA

return aA
end

function Y.AddLeftGroupbox(au,av,aw)
return Y:AddGroupbox{Side=1,Name=av,IconName=aw}
end

function Y.AddRightGroupbox(au,av,aw)
return Y:AddGroupbox{Side=2,Name=av,IconName=aw}
end

function Y.AddTabbox(au,av)
local aw=New("Frame",{
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
Size=UDim2.fromScale(1,0),
Parent=av.Side==1 and S or T,
})
New("UIListLayout",{
Padding=UDim.new(0,6),
Parent=aw,
})

local ax=t:MakeOutline(aw,ac.CornerRadius)
ax.Size=UDim2.fromScale(1,0)
t:UpdateDPI(ax,{
Size=false,
})

local ay
local az

do
ay=New("Frame",{
BackgroundColor3="BackgroundColor",
Position=UDim2.fromOffset(2,2),
Size=UDim2.new(1,-4,1,-4),
Parent=ax,
})
New("UICorner",{
CornerRadius=UDim.new(0,ac.CornerRadius-1),
Parent=ay,
})

az=New("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,34),
Parent=ay,
})
New("UIListLayout",{
FillDirection=Enum.FillDirection.Horizontal,
HorizontalFlex=Enum.UIFlexAlignment.Fill,
Parent=az,
})
end

local aA={
ActiveTab=nil,

BoxHolder=aw,
Holder=ax,
Tabs={},
}

function aA.AddTab(aB,Z)
local _=New("TextButton",{
BackgroundColor3="MainColor",
BackgroundTransparency=0,
Size=UDim2.fromOffset(0,34),
Text=Z,
TextSize=15,
TextTransparency=0.5,
Parent=az,
})

local aC=t:MakeLine(_,{
AnchorPoint=Vector2.new(0,1),
Position=UDim2.new(0,0,1,1),
Size=UDim2.new(1,0,0,1),
})

local aD=New("Frame",{
BackgroundTransparency=1,
Position=UDim2.fromOffset(0,35),
Size=UDim2.new(1,0,1,-35),
Visible=false,
Parent=ay,
})
local aE=New("UIListLayout",{
Padding=UDim.new(0,8),
Parent=aD,
})
New("UIPadding",{
PaddingBottom=UDim.new(0,7),
PaddingLeft=UDim.new(0,7),
PaddingRight=UDim.new(0,7),
PaddingTop=UDim.new(0,7),
Parent=aD,
})

local aF={
ButtonHolder=_,
Container=aD,

Tab=Y,
Elements={},
DependencyBoxes={},
}

function aF.Show(aG)
if aA.ActiveTab then
aA.ActiveTab:Hide()
end

_.BackgroundTransparency=1
_.TextTransparency=0
aC.Visible=false

aD.Visible=true

aA.ActiveTab=aF
aF:Resize()
end

function aF.Hide(aG)
_.BackgroundTransparency=0
_.TextTransparency=0.5
aC.Visible=true
aD.Visible=false

aA.ActiveTab=nil
end

function aF.Resize(aG)
if aA.ActiveTab~=aF then
return
end
ax.Size=UDim2.new(1,0,0,aE.AbsoluteContentSize.Y+53*t.DPIScale)
end


if not aA.ActiveTab then
aF:Show()
end

_.MouseButton1Click:Connect(aF.Show)

setmetatable(aF,aa)

aA.Tabs[Z]=aF

return aF
end

if av.Name then
Y.Tabboxes[av.Name]=aA
else
table.insert(Y.Tabboxes,aA)
end

return aA
end

function Y.AddLeftTabbox(au,av)
return Y:AddTabbox{Side=1,Name=av}
end

function Y.AddRightTabbox(au,av)
return Y:AddTabbox{Side=2,Name=av}
end

function Y.Hover(au,av)
if t.ActiveTab==Y then
return
end

i:Create(P,t.TweenInfo,{
TextTransparency=av and 0.25 or 0.5,
}):Play()
if Q then
i:Create(Q,t.TweenInfo,{
ImageTransparency=av and 0.25 or 0.5,
}):Play()
end
end

function Y.Show(au)
if t.ActiveTab then
t.ActiveTab:Hide()
end

i:Create(at,t.TweenInfo,{
BackgroundTransparency=0,
}):Play()
i:Create(P,t.TweenInfo,{
TextTransparency=0,
}):Play()
if Q then
i:Create(Q,t.TweenInfo,{
ImageTransparency=0,
}):Play()
end

if as then
ai.Visible=true
ah.Size=UDim2.fromScale(0.5,1)
aj.Text=aq
ak.Text=as
end

R.Visible=true

t.ActiveTab=Y
end

function Y.Hide(au)
i:Create(at,t.TweenInfo,{
BackgroundTransparency=1,
}):Play()
i:Create(P,t.TweenInfo,{
TextTransparency=0.5,
}):Play()
if Q then
i:Create(Q,t.TweenInfo,{
ImageTransparency=0.5,
}):Play()
end
R.Visible=false

ah.Size=UDim2.fromScale(1,1)
ai.Visible=false

t.ActiveTab=nil
end


if not t.ActiveTab then
Y:Show()
end

at.MouseEnter:Connect(function()
Y:Hover(true)
end)
at.MouseLeave:Connect(function()
Y:Hover(false)
end)
at.MouseButton1Click:Connect(Y.Show)

t.Tabs[aq]=Y

return Y
end

function ao.AddKeyTab(ap,aq)
local ar:TextButton
local as
local at

local au

do
ar=New("TextButton",{
BackgroundColor3="MainColor",
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,40),
Text="",
Parent=am,
})
New("UIPadding",{
PaddingBottom=UDim.new(0,11),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
PaddingTop=UDim.new(0,11),
Parent=ar,
})

as=New("TextLabel",{
BackgroundTransparency=1,
Position=UDim2.fromOffset(30,0),
Size=UDim2.new(1,-30,1,0),
Text=aq,
TextSize=16,
TextTransparency=0.5,
TextXAlignment=Enum.TextXAlignment.Left,
Parent=ar,
})

if N then
at=New("ImageLabel",{
Image=N.Url,
ImageColor3="AccentColor",
ImageRectOffset=N.ImageRectOffset,
ImageRectSize=N.ImageRectSize,
ImageTransparency=0.5,
Size=UDim2.fromScale(1,1),
SizeConstraint=Enum.SizeConstraint.RelativeYY,
Parent=ar,
})
end


au=New("ScrollingFrame",{
AutomaticCanvasSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
CanvasSize=UDim2.fromScale(0,0),
ScrollBarThickness=0,
Size=UDim2.fromScale(1,1),
Visible=false,
Parent=an,
})
New("UIListLayout",{
HorizontalAlignment=Enum.HorizontalAlignment.Center,
Padding=UDim.new(0,8),
VerticalAlignment=Enum.VerticalAlignment.Center,
Parent=au,
})
New("UIPadding",{
PaddingLeft=UDim.new(0,1),
PaddingRight=UDim.new(0,1),
Parent=au,
})
end


local av={
Elements={},
IsKeyTab=true,
}

function av.AddKeyBox(aw,...)
local ax={}

local ay=select(1,...)

if typeof(ay)=="function"then
ax.Callback=ay
else
ax.ExpectedKey=ay
ax.Callback=select(2,...)
end

local az=New("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(0.75,0,0,21),
Parent=au,
})

local aA=New("TextBox",{
BackgroundColor3="MainColor",
BorderColor3="OutlineColor",
BorderSizePixel=1,
PlaceholderText="Key",
Size=UDim2.new(1,-71,1,0),
TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,
Parent=az,
})
New("UIPadding",{
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
Parent=aA,
})

local aB=New("TextButton",{
AnchorPoint=Vector2.new(1,0),
BackgroundColor3="MainColor",
BorderColor3="OutlineColor",
BorderSizePixel=1,
Position=UDim2.fromScale(1,0),
Size=UDim2.new(0,63,1,0),
Text="Execute",
TextSize=14,
Parent=az,
})

aB.MouseButton1Click:Connect(function()
if ax.ExpectedKey and aA.Text~=ax.ExpectedKey then
ax.Callback(false,aA.Text)
return
end

ax.Callback(true,aA.Text)
end)
end

function av.Resize(aw)end

function av.Hover(aw,ax)
if t.ActiveTab==av then
return
end

i:Create(as,t.TweenInfo,{
TextTransparency=ax and 0.25 or 0.5,
}):Play()
if at then
i:Create(at,t.TweenInfo,{
ImageTransparency=ax and 0.25 or 0.5,
}):Play()
end
end

function av.Show(aw)
if t.ActiveTab then
t.ActiveTab:Hide()
end

i:Create(ar,t.TweenInfo,{
BackgroundTransparency=0,
}):Play()
i:Create(as,t.TweenInfo,{
TextTransparency=0,
}):Play()
if at then
i:Create(at,t.TweenInfo,{
ImageTransparency=0,
}):Play()
end
au.Visible=true

t.ActiveTab=av
end

function av.Hide(aw)
i:Create(ar,t.TweenInfo,{
BackgroundTransparency=1,
}):Play()
i:Create(as,t.TweenInfo,{
TextTransparency=0.5,
}):Play()
if at then
i:Create(at,t.TweenInfo,{
ImageTransparency=0.5,
}):Play()
end
au.Visible=false

t.ActiveTab=nil
end


if not t.ActiveTab then
av:Show()
end

ar.MouseEnter:Connect(function()
av:Hover(true)
end)
ar.MouseLeave:Connect(function()
av:Hover(false)
end)
ar.MouseButton1Click:Connect(av.Show)

av.Container=au
setmetatable(av,aa)

t.Tabs[aq]=av

return av
end

function t.Toggle(ap,aq:boolean?)
if typeof(aq)=="boolean"then
t.Toggled=aq
else
t.Toggled=not t.Toggled
end

ag.Visible=t.Toggled
D.Modal=t.Toggled

if t.Toggled and not t.IsMobile then
local ar=f.MouseIconEnabled
pcall(function()
d:UnbindFromRenderStep"ShowCursor"
end)
d:BindToRenderStep("ShowCursor",Enum.RenderPriority.Last.Value,function()
f.MouseIconEnabled=not t.ShowCustomCursor

E.Position=UDim2.fromOffset(o.X,o.Y)
E.Visible=t.ShowCustomCursor

if not(t.Toggled and B and B.Parent)then
f.MouseIconEnabled=ar
E.Visible=false
d:UnbindFromRenderStep"ShowCursor"
end
end)
elseif not t.Toggled then
I.Visible=false
for ar,as in pairs(t.Options)do
if as.Type=="ColorPicker"then
as.ColorMenu:Close()
as.ContextMenu:Close()
elseif as.Type=="Dropdown"or as.Type=="KeyPicker"then
as.Menu:Close()
end
end
end
end

if ac.AutoShow then
if ac.Loader then
local ap=ac.LoaderIcon or ac.Icon
local aq=t:CreateLoader(ap,ac.LoaderDuration)
task.spawn(function()
aq.yield()
t:Toggle()
end)
else
task.spawn(t.Toggle)
end
end

if t.IsMobile then
local ap=t:AddDraggableButton("Toggle",function()
t:Toggle()
end)

local aq=t:AddDraggableButton("Lock",function(aq)
t.CantDragForced=not t.CantDragForced
aq:SetText(t.CantDragForced and"Unlock"or"Lock")
end)

if ac.MobileButtonsSide=="Right"then
ap.Button.Position=UDim2.new(1,-6,0,6)
ap.Button.AnchorPoint=Vector2.new(1,0)

aq.Button.Position=UDim2.new(1,-6,0,46)
aq.Button.AnchorPoint=Vector2.new(1,0)
else
aq.Button.Position=UDim2.fromOffset(6,46)
end
end


ah:GetPropertyChangedSignal"Text":Connect(function()
t:UpdateSearch(ah.Text)
end)

t:GiveSignal(f.InputBegan:Connect(function(ap:InputObject)
if f:GetFocusedTextBox()then
return
end

if
(
typeof(t.ToggleKeybind)=="table"
and t.ToggleKeybind.Type=="KeyPicker"
and ap.KeyCode.Name==t.ToggleKeybind.Value
)or ap.KeyCode==t.ToggleKeybind
then
t.Toggle()
end
end))

t:GiveSignal(f.WindowFocused:Connect(function()
t.IsRobloxFocused=true
end))
t:GiveSignal(f.WindowFocusReleased:Connect(function()
t.IsRobloxFocused=false
end))

return ao
end

local function OnPlayerChange()
local ab,ac=GetPlayers(),GetPlayers(true)

for ad,ae in pairs(s)do
if ae.Type=="Dropdown"and ae.SpecialType=="Player"then
ae:SetValues(ae.ExcludeLocalPlayer and ac or ab)
end
end
end
local function OnTeamChange()
local ab=GetTeams()

for ac,ad in pairs(s)do
if ad.Type=="Dropdown"and ad.SpecialType=="Team"then
ad:SetValues(ab)
end
end
end

t:GiveSignal(c.PlayerAdded:Connect(OnPlayerChange))
t:GiveSignal(c.PlayerRemoving:Connect(OnPlayerChange))

t:GiveSignal(h.ChildAdded:Connect(OnTeamChange))
t:GiveSignal(h.ChildRemoved:Connect(OnTeamChange))

j().Library=t
return t
