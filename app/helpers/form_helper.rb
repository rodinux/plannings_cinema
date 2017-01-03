module FormHelper
  def setup_seance(seance)
    3.times { seance.entrees.build }
    seance.entree ||= Entree.new
    seance
  end
end