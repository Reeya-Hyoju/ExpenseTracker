﻿using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ExpenseTracker.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class AddingTagEntity : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Tag",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "TEXT", nullable: false),
                    Name = table.Column<string>(type: "TEXT", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Tag", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Transaction_TagsId",
                table: "Transaction",
                column: "TagsId");

            migrationBuilder.AddForeignKey(
                name: "FK_Transaction_Tag_TagsId",
                table: "Transaction",
                column: "TagsId",
                principalTable: "Tag",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Transaction_Tag_TagsId",
                table: "Transaction");

            migrationBuilder.DropTable(
                name: "Tag");

            migrationBuilder.DropIndex(
                name: "IX_Transaction_TagsId",
                table: "Transaction");
        }
    }
}