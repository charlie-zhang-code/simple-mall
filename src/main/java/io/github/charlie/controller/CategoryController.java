package io.github.charlie.controller;

import io.github.charlie.base.IDs;
import io.github.charlie.base.Result;
import io.github.charlie.convert.CategoryConvert;
import io.github.charlie.model.entity.Category;
import io.github.charlie.model.entity.Role;
import io.github.charlie.model.form.CategoryForm;
import io.github.charlie.model.form.RoleForm;
import io.github.charlie.service.CategoryService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @Author: charlie-zhang-code
 * @Date: 2025/2/5
 * @Description: 类别控制器
 */
@Tag(name = "类别管理")
@RequestMapping("/api/v1/category")
@RestController
@RequiredArgsConstructor
public class CategoryController {
    private final CategoryService service;
    private final CategoryConvert convert;

    @Operation(summary = "创建类别")
    @PostMapping
    public Result<Boolean> create(@RequestBody CategoryForm form) {
        Category entity = convert.toEntity(form);
        entity.setId(null);
        boolean save = service.save(entity);
        return Result.status(save);
    }

    @Operation(summary = "删除类别")
    @DeleteMapping
    public Result<Boolean> delete(@RequestBody IDs iDs) {
        boolean remove = service.removeByIds(iDs.getIds());
        return Result.status(remove);
    }

    @Operation(summary = "修改类别")
    @PutMapping
    public Result<Boolean> update(@RequestBody CategoryForm form) {
        Category entity = convert.toEntity(form);
        boolean update = service.updateById(entity);
        return Result.status(update);
    }

    @Operation(summary = "查询类别")
    @GetMapping("/{id}")
    public Result<Category> get(@PathVariable Long id) {
        Category entity = service.getById(id);
        return Result.success(entity);
    }
}
