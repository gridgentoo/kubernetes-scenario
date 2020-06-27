Наш первый пример покажет, как мы можем создать валидный **webhook** при помощи **Gatekeeper**. Этот пример продемонстрирует, как вам могут потребоваться определенные атрибуты для объекта **Kubernetes**, прежде чем они будут приняты в кластер.

**Gatekeeper** определяет два типа пользовательских ресурсов Kubernetes для создания политик. **ConstraintTemplates** является шаблоном политики **OPA** и определяет параметры, необходимые для использования шаблона **template**. После отправки **ConstraintTemplate** создает кастомный ресурс **Kubernetes** на основе включенной конфигурации, которая называется **Constraint**. **Constraint** содержит обязательные параметры и типы событий **Kubernetes**, которые инициируют **trigger policy**. 

Как только **Constraint** отправляется в кластер, он создает уникальный объект **ValidatingAdmissionWebhook** на основе конфигурации.

1. Чтобы начать, сначала отправьте **ConstraintTemplate**, для которого требуется метка **owner** на каждом ресурсе в определенном пространстве имен:
   `kubectl apply -f required-labels-template.yaml`{{execute}}
   Убедитесь, что вы создали новый **ConstraintTemplate**:
   `kubectl get constrainttemplates.templates.gatekeeper.sh`{{execute}}
1. Установите обязательное ограничение **labels constraint** для всех объектов в пространстве имен **default**:
   `kubectl apply -f required-labels-constraint.yaml`{{execute}}
   Убедитесь, что вы создали новое ограничение **requiredlabels**:
   `kubectl get requiredlabels.constraints.gatekeeper.sh`{{execute}}
1. Чтобы продемонстрировать политику, запрещающую ресурсы **denying resources**, которые не объявляют метку **owner label**, создайте **pod** и покажите возвращаемое сообщение об ошибке:
   `kubectl apply -f required-labels-deny.yaml`{{execute}}
   
1. В качестве альтернативы, создайте **pod**, в котором **does** указывает метку **owner label** для прохождения валидации

   `kubectl apply -f required-labels-allow.yaml`{{execute}}

   `nano required-labels-allow.yaml`{{execute}}

1. Удалите задепломеный **pod**, прежде чем приступить к *challenge*:
   `kubectl delete pod busybox-valid`{{execute}}

## CHALLENGE

Обновите **required-tags-constraint.yaml**, чтобы потребовать другой ярлык **team**. Затем повторно передайте новое **ограничение == constraint** вместе с новым **pod**, в котором также указывается метка **team label**, прежде чем продолжить.