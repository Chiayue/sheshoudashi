if ability_shishi_challenge == nil then
	ability_shishi_challenge = class({})
end
LinkLuaModifier("modifier_ability_shishi_challenge","ability/challenge/ability_shishi_challenge",LUA_MODIFIER_MOTION_NONE )

function ability_shishi_challenge:GetIntrinsicModifierName()
	return "modifier_ability_shishi_challenge"
end

--------------------------------------------------------------------------------

if modifier_ability_shishi_challenge == nil then
	modifier_ability_shishi_challenge = class({})
end

function modifier_ability_shishi_challenge:IsHidden()
	return true
end

function modifier_ability_shishi_challenge:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

function modifier_ability_shishi_challenge:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
        MODIFIER_PROPERTY_ATTACK_RANGE_BONUS,
        MODIFIER_EVENT_ON_DEATH,
        MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
        MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
    }
    return funcs
end

-- function modifier_ability_shishi_challenge:OnCreated( kv )
-- 	self:StartIntervalThink( 0.01 )
-- end

-- function modifier_ability_shishi_challenge:OnIntervalThink()
--     self.attack_speed = self:GetAbility():GetSpecialValueFor( "attack_speed" ) 
--     self.range_bonus = self:GetAbility():GetSpecialValueFor( "range_bonus" ) 
--     self.kill_reward = self:GetAbility():GetSpecialValueFor( "kill_reward" ) 
--     self.attribute_promotion = self:GetAbility():GetSpecialValueFor( "attribute_promotion" ) 
-- 	self:StartIntervalThink(-1)
-- end

-- 攻速
function modifier_ability_shishi_challenge:GetModifierAttackSpeedBonus_Constant()
    return 30
end

--射程
function modifier_ability_shishi_challenge:GetModifierAttackRangeBonus()
	return 100
end

--金币奖励
function modifier_ability_shishi_challenge:OnDeath(args)
	local nAttacker = args.attacker
	local nCaster = self:GetParent()
    if nAttacker == nCaster then
        local PlayerID = nAttacker:GetOwner():GetPlayerID()
        PlayerResource:ModifyGold(PlayerID,10,true,DOTA_ModifyGold_Unspecified)
        PopupGoldGain(nAttacker, 10)
	end
end

--力量
function modifier_ability_shishi_challenge:GetModifierBonusStats_Strength()
    return 280
end

--智力
function modifier_ability_shishi_challenge:GetModifierBonusStats_Intellect()
    return 280
end

--敏捷
function modifier_ability_shishi_challenge:GetModifierBonusStats_Agility()
    return 280
end