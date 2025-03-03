# Generated by Django 5.1.1 on 2024-10-12 10:56

import django.contrib.auth.validators
import groups_app.models
import uuid
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="Group",
            fields=[
                (
                    "id",
                    models.UUIDField(
                        default=uuid.uuid4,
                        editable=False,
                        primary_key=True,
                        serialize=False,
                    ),
                ),
                (
                    "groupname",
                    models.CharField(
                        error_messages={"unique": "This group already exists."},
                        max_length=20,
                        unique=True,
                        validators=[
                            django.contrib.auth.validators.UnicodeUsernameValidator()
                        ],
                        verbose_name="Groupname",
                    ),
                ),
                ("title", models.CharField(max_length=64, verbose_name="Title")),
                (
                    "profile_pic",
                    models.ImageField(
                        blank=True,
                        null=True,
                        upload_to=groups_app.models.Group.img_path,
                        verbose_name="Profile picture",
                    ),
                ),
                (
                    "description",
                    models.CharField(
                        blank=True,
                        max_length=128,
                        null=True,
                        verbose_name="Description",
                    ),
                ),
                (
                    "site_url",
                    models.URLField(
                        blank=True,
                        max_length=128,
                        null=True,
                        verbose_name="Website url",
                    ),
                ),
            ],
            options={
                "verbose_name": "Group",
                "verbose_name_plural": "Groups",
            },
        ),
    ]
