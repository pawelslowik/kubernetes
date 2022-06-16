package pl.com.psl.kubernetes.notesservice;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "notes", path = "notes")
public interface NotesRepository extends MongoRepository<Note, String> {
}
