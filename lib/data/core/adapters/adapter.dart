abstract class Adapter<Entity, Model> {
  // Convierte una entidad a un modelo
  Model entityToModel(Entity entity);

  // Convierte un modelo a una entidad
  Entity modelToEntity(Model model);
}
