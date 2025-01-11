-- Definindo as variáveis necessárias
local player = game.Players.LocalPlayer -- Referência ao jogador local
local character = player.Character or player.CharacterAdded:Wait() -- Obtém o personagem do jogador
local humanoidRootPart = character:WaitForChild("HumanoidRootPart") -- Parte central do personagem

-- Salvar a localização atual do personagem
local originalPosition = humanoidRootPart.CFrame

-- Função para localizar o GunDrop no Workspace
local function findGunDrop()
    for _, item in pairs(game:GetService("Workspace"):GetDescendants()) do
        if item:IsA("BasePart") and item.Name == "GunDrop" then
            return item -- Retorna o GunDrop encontrado
        end
    end
    return nil -- Retorna nil se o GunDrop não for encontrado
end

-- Localizando o GunDrop
local gunDrop = findGunDrop()

-- Verifica se o GunDrop existe
if gunDrop then
    -- Função para teleportar o personagem
    local function teleportTo(targetPosition)
        humanoidRootPart.CFrame = targetPosition
    end

    -- Teleporta o personagem para uma posição logo acima do GunDrop
    local offset = Vector3.new(0, 5, 0) -- Ajuste a altura conforme necessário (5 unidades acima)
    teleportTo(gunDrop.CFrame + offset)

    -- Pausa por um curto período de tempo
    wait(0.2) -- 0.2 segundos (ajuste conforme necessário para sua aplicação)

    -- Teleporta o personagem de volta para a posição original
    teleportTo(originalPosition)
else
    warn("GunDrop não encontrado no Workspace.")
end
