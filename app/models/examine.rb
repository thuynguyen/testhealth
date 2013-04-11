class Examine < ActiveRecord::Base
  attr_accessible :kind, :price
  belongs_to :patient
  scope :by_type, lambda {|type| where(kind: type)}

  TYPES = {1 => I18n.t("patients.types.examine"),
           2 => I18n.t("patients.types.supper_sound"),
           3 => I18n.t("patients.types.supper_sound_4d"),
           4 => I18n.t("patients.types.supper_sound_4d_disk"),
           5 => I18n.t("patients.types.gyn"),
           6 => I18n.t("patients.types.thy"),
           7 => I18n.t("patients.types.general"),
           8 => I18n.t("patients.types.dmdg"),
           9 => I18n.t("patients.types.device"),
           10 => I18n.t("patients.types.dhkn"),
           11 => I18n.t("patients.types.egg"),
           12 => I18n.t("patients.types.circle")
          }

  PRICES = { 1 => 50, 2 => 120, 3 => 60, 4 => 150,
             5 => 50, 6 => 60, 7 => 60, 8 => 80,
             9 => 70, 10 => 40, 11 => 40, 12 => 300
           }

end
