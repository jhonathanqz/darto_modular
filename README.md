<div align="center" id="top"> 
  <img src="assets/darto_module.png" alt="Darto Module" height="200" />
</div>

<h1 align="center">Darto Modular</h1>

<p align="center">
  <a href="#dart-about">About</a> &#xa0; | &#xa0; 
  <a href="#sparkles-features">Features</a> &#xa0; | &#xa0;
  <a href="#white_check_mark-requirements">Requirements</a> &#xa0; | &#xa0;
  <a href="#checkered_flag-getting-started">Getting Started</a> &#xa0; | &#xa0;
  <a href="#file_folder-project-structure">Project Structure</a> &#xa0; 
</p>

<br>

## :dart: About

**Darto Module** is an extension for [darto](https://pub.dev/packages/darto) that adds support for **modular architecture**, **dependency injection**, and **automatic route/service organization** in a more scalable way.

It does not replace `darto`, but works as a **complement**, providing an abstraction layer for building more structured APIs with **independent and reusable modules**.

---

## :sparkles: Features

- 🔹 Modular structure to organize your project into independent modules
- 🔹 Simple and flexible dependency injection
- 🔹 Automatic route and middleware registration per module
- 🔹 Improved scalability for medium and large projects
- 🔹 Fully compatible with **darto**

---

## :white_check_mark: Requirements

Add to your `pubspec.yaml`:

```yaml
dependencies:
  darto: any
  darto_module: any
```

## :checkered_flag: Getting Started

1. Create a HealthModule

```dart
class HealthModule extends DartoModule {
  @override
  void onBinds(Injector i) {
    i.registerFactory(() => HealthController());
  }

  @override
  void onConfigureRoutes(Router router, Injector i) {
    final HealthController controller = i.get();

    router.get('/', controller.healthCheck);
  }
}
```

2. Create server:

```dart
void main() async {
  final app = Darto();

  app.use('/health-check', HealthModule().init);

  app.timeout(30000);

  app.listen(3000, () {
    print('Server is running on port 3000');
  });
}
```

Now you can access:

```bash
http://localhost:3000/health-check
```

## :file_folder: Project Structure (suggested)

```css
bin/
  main.dart
lib/
  modules/
    health/
      health_module.dart
      health_controller.dart
```

## :heavy_plus_sign: Extra

We also provide access to the `Result` class, allowing you to configure a **dynamic and easy-to-use result**.

#### Example usage

```dart
return Result.success(data);
```

or

```dart
  Future<Result<CompanyModel>> call(String id) async {
    try {
      final result = await _companyRepository.getById(id);
      if (result == null) {
        return Result.failure('Company not found');
      }
      final resultModel = CompanyModel.fromMap(result);
      return Result.success(resultModel);
    } catch (error) {
      return Result.failure('Failed to get company', error);
    }
  }
```

### ResultHanlder

In the `ResultHandler` class, all the most commonly used response types are centralized, making the response method easier to use and map.  
Below are some usage examples:

##### Error example

```dart
return ResultHandler.error.forbidden(res, errorMessage);

```

##### Success example:

```dart
return ResultHandler.success.ok(res, {'status': 'success'});
```

Or by implementing a handler that checks the type of exception and returns the mapped response:

```dart
ResultHandler.errorHanlder(res, exception);
```

The pre-mapped exceptions are listed below:

```dart
class InternalServerErrorApi extends ErrorApi {
  InternalServerErrorApi(super.message);
}

class LengthRequiredApi extends ErrorApi {
  LengthRequiredApi(super.message);
}

class ExceptionApi extends ErrorApi {
  ExceptionApi(super.message);
}

class UpdateRecognitionApi extends ErrorApi {
  UpdateRecognitionApi(super.message);
}

class NotFoundApi extends ErrorApi {
  NotFoundApi(super.message);
}

class UnAuthorizedApi extends ErrorApi {
  UnAuthorizedApi(super.message);
}

class AlreadyExistsApi extends ErrorApi {
  AlreadyExistsApi(super.message);
}

class ConflictApi extends ErrorApi {
  ConflictApi(super.message);
}

class NotCreatedApi extends ErrorApi {
  NotCreatedApi(super.message);
}

class UpdatePasswordNotFoundApi extends ErrorApi {
  UpdatePasswordNotFoundApi(super.message);
}

class TooManyRequestsApi extends ErrorApi {
  TooManyRequestsApi(super.message);
}

class PreconditionApi extends ErrorApi {
  PreconditionApi(super.message);
}

class PreconditionRequiredApi extends ErrorApi {
  PreconditionRequiredApi(super.message);
}
```

---

<div align="left">
  <table>
  <tr>
  Made with:
    <td align="center"><a href="https://github.com/jhonathanqz"><img src="https://avatars.githubusercontent.com/u/74057391?s=96&v=4" width="100px;" alt=""/><br /><sub><b>Jhonathan Queiroz</b></sub></a><br /> <a href="https://github.com/jhonathanqz" title="Autor"></a></td>
  </tr>

</table>

</div>

&#xa0;

<a href="#top">Back to top</a>
