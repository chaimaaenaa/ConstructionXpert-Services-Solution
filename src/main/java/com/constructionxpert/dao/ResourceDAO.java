package com.constructionxpert.dao;

import com.constructionxpert.model.Resource;
import java.util.List;

public interface ResourceDAO {
    void addResource(Resource resource);
    void updateResource(Resource resource);
    void deleteResource(int id);
    Resource getResourceById(int id);
    List<Resource> getAllResourcesByProjectId(int projectId);
}
