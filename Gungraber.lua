-- Definindo as variáveis necessárias
local player = game.Players.LocalPlayer -- Referência ao jogador local
local character = player.Character or player.CharacterAdded:Wait() -- Obtém o personagem do jogador
local humanoidRootPart = character:WaitForChild("HumanoidRootPart") -- Parte central do personagem

-- Salvar a localização atual do personagem
local originalPosition = humanoidRootPart.CFrame

-- Localizando o item GunDrop no Workspace
local gunDrop = game:GetService("Workspace"):WaitForChild("GunDrop")

-- Função para teleportar o personagem
local function teleportTo(targetPosition)
    humanoidRootPart.CFrame = targetPosition
end

-- Teleporta o personagem para uma posição logo acima do GunDrop
local offset = Vector3.new(0, 5, 0) -- Ajuste a altura conforme necessário (5 unidades acima)
teleportTo(gunDrop.CFrame + offset)

-- Pausa por um curto período de tempo
wait(0.5) -- 0.1 segundos (ajuste conforme necessário para sua aplicação)

-- Teleporta o personagem de volta para a posição original
teleportTo(originalPosition)