game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Admin Detector";
    Text = "Script Is Succesfully Executed."
})

game.Players.PlayerAdded:Connect(function(AddedPlayer)
	if AddedPlayer:IsInGroup(4800422) then
		game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Admin Detector";
            Text = "An Admin Joined The Game! (" .. AddedPlayer.Name .. ")"
        })
	end
end)