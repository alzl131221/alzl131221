-- 예: Workspace 안에 Script로 넣기

local Players = game:GetService("Players")

local function highlightCharacter(character)
	local highlight = Instance.new("Highlight")
	highlight.Name = "PlayerHighlight"
	highlight.FillColor = Color3.fromRGB(255, 255, 0)
	highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
	highlight.FillTransparency = 0.3
	highlight.OutlineTransparency = 0
	highlight.Adornee = character
	highlight.Parent = character
end

local function onPlayerAdded(player)
	player.CharacterAdded:Connect(function(character)
		-- 캐릭터 로딩이 완료될 때까지 잠시 대기
		repeat wait() until character:FindFirstChild("HumanoidRootPart")
		highlightCharacter(character)
	end)
end

-- 기존 플레이어 처리
for _, player in ipairs(Players:GetPlayers()) do
	onPlayerAdded(player)
end

-- 새로 들어오는 플레이어 처리
Players.PlayerAdded:Connect(onPlayerAdded)
